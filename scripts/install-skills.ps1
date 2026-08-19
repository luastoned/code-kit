<#
.SYNOPSIS
Links code-kit skills into Codex, Claude, or both runtimes.

.DESCRIPTION
Installs every available skill when no skill names are provided. Installs only
the named skills when one or more skill names are provided. Refreshes existing
symbolic links and refuses to overwrite non-symlink files or directories.

.PARAMETER Runtime
Selects codex, claude, or all. This parameter is required.

.PARAMETER Skill
Selects one or more skills. Omit this parameter to install all skills.

.PARAMETER Help
Shows command usage and exits.

.EXAMPLE
.\scripts\install-skills.ps1 codex

.EXAMPLE
.\scripts\install-skills.ps1 claude session-state polish-readme

.EXAMPLE
.\scripts\install-skills.ps1 all sync-agent-guidance sync-project-configs
#>

[CmdletBinding()]
param(
  [Parameter(Position = 0)]
  [string] $Runtime,

  [Parameter(Position = 1, ValueFromRemainingArguments)]
  [string[]] $Skill,

  [Alias('h')]
  [switch] $Help
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Show-Usage {
  $Usage = @'
Usage: .\scripts\install-skills.ps1 <codex|claude|all> [skill ...]

Install every skill when no skill names are provided, or install only the
named skills. Existing symbolic links are refreshed. Non-symlink files and
directories are never overwritten.

Examples:
  .\scripts\install-skills.ps1 codex
  .\scripts\install-skills.ps1 claude session-state polish-readme
  .\scripts\install-skills.ps1 all sync-agent-guidance sync-project-configs

Help:
  .\scripts\install-skills.ps1 -Help
  .\scripts\install-skills.ps1 -h
  .\scripts\install-skills.ps1 --help
'@

  Write-Host $Usage
}

if ($Help -or $Runtime -eq '--help') {
  Show-Usage
  exit 0
}

if ([string]::IsNullOrWhiteSpace($Runtime)) {
  Show-Usage
  exit 2
}

$SupportedRuntimes = @('codex', 'claude', 'all')
if ($Runtime -notin $SupportedRuntimes) {
  Show-Usage
  throw "Unsupported runtime: $Runtime"
}

$RepoRoot = Split-Path -Parent $PSScriptRoot
$SkillsRoot = Join-Path $RepoRoot 'skills'

$SelectedSkills = @(
  @($Skill) | Where-Object { -not [string]::IsNullOrWhiteSpace($_) }
)

if ($SelectedSkills.Count -eq 0) {
  $SelectedSkills = @(
    Get-ChildItem -LiteralPath $SkillsRoot -Directory |
      Where-Object { Test-Path -LiteralPath (Join-Path $_.FullName 'SKILL.md') -PathType Leaf } |
      Sort-Object -Property Name |
      ForEach-Object { $_.Name }
  )
}

if ($SelectedSkills.Count -eq 0) {
  throw "No skills found under $SkillsRoot."
}

function Install-ForRuntime {
  param(
    [Parameter(Mandatory)]
    [ValidateSet('codex', 'claude')]
    [string] $SelectedRuntime
  )

  if ($SelectedRuntime -eq 'codex') {
    $RuntimeHome = if ([string]::IsNullOrWhiteSpace($env:CODEX_HOME)) {
      Join-Path $HOME '.codex'
    } else {
      $env:CODEX_HOME
    }
  } else {
    $RuntimeHome = Join-Path $HOME '.claude'
  }

  $TargetRoot = Join-Path $RuntimeHome 'skills'
  New-Item -ItemType Directory -Path $TargetRoot -Force | Out-Null

  foreach ($SkillName in $SelectedSkills) {
    if ($SkillName -notmatch '^[a-z0-9-]+$') {
      throw "Invalid skill name: $SkillName"
    }

    $SourcePath = Join-Path $SkillsRoot $SkillName
    $SkillEntrypoint = Join-Path $SourcePath 'SKILL.md'

    if (-not (Test-Path -LiteralPath $SkillEntrypoint -PathType Leaf)) {
      throw "Unknown skill: $SkillName"
    }

    $Destination = Join-Path $TargetRoot $SkillName
    $Existing = Get-Item -LiteralPath $Destination -Force -ErrorAction SilentlyContinue

    if ($null -ne $Existing) {
      if ($Existing.LinkType -ne 'SymbolicLink') {
        throw "Refusing to overwrite non-symlink: $Destination"
      }

      $CurrentTarget = @($Existing.Target)[0]
      if (-not [System.IO.Path]::IsPathRooted($CurrentTarget)) {
        $CurrentTarget = Join-Path $Existing.DirectoryName $CurrentTarget
      }

      $CurrentTarget = [System.IO.Path]::GetFullPath($CurrentTarget)
      $ExpectedTarget = [System.IO.Path]::GetFullPath($SourcePath)
      if ([System.StringComparer]::OrdinalIgnoreCase.Equals($CurrentTarget, $ExpectedTarget)) {
        Write-Host "Already linked: $Destination -> $SourcePath"
        continue
      }

      Remove-Item -LiteralPath $Destination -Force
    }

    try {
      New-Item -ItemType SymbolicLink -Path $Destination -Target $SourcePath | Out-Null
    } catch {
      throw "Could not create symbolic link $Destination. Enable Windows Developer Mode or run PowerShell as an administrator. $($_.Exception.Message)"
    }

    Write-Host "Linked: $Destination -> $SourcePath"
  }
}

if ($Runtime -eq 'all') {
  Install-ForRuntime -SelectedRuntime 'codex'
  Install-ForRuntime -SelectedRuntime 'claude'
} else {
  Install-ForRuntime -SelectedRuntime $Runtime
}
