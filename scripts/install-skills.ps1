<#
.SYNOPSIS
Links code-kit skills into Codex, Claude, or both runtimes.

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
  [ValidateSet('codex', 'claude', 'all')]
  [string] $Runtime = 'codex',

  [Parameter(Position = 1, ValueFromRemainingArguments)]
  [ValidatePattern('^[a-z0-9-]+$')]
  [string[]] $Skill
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$RepoRoot = Split-Path -Parent $PSScriptRoot
$SkillsRoot = Join-Path $RepoRoot 'skills'

if (@($Skill).Count -gt 0) {
  $SelectedSkills = @($Skill)
} else {
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
