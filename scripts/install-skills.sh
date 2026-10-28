#!/usr/bin/env bash

set -euo pipefail

usage() {
  cat <<'EOF'
Usage: scripts/install-skills.sh <codex|claude|all> [skill ...]

Install every skill when no skill names are provided, or install only the
named skills. Existing symlinks are refreshed. Non-symlink files and directories
are never overwritten. Full installs also remove stale installer-created links
into this checkout when the skill no longer has a SKILL.md. Named installs
do not clean up other skills.

Examples:
  scripts/install-skills.sh codex
  scripts/install-skills.sh claude session-state polish-readme
  scripts/install-skills.sh all sync-agent-guidance sync-project-configs
EOF
}

if [[ ${1:-} == '--help' || ${1:-} == '-h' ]]; then
  usage
  exit 0
fi

runtime=${1:-}
if [[ -z $runtime ]]; then
  usage >&2
  exit 2
fi
shift

script_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)
repo_root=$(cd -- "$script_dir/.." && pwd -P)

install_all=false
selected_skills=()
if (( $# > 0 )); then
  selected_skills=("$@")
else
  install_all=true
  for skill_path in "$repo_root"/skills/*; do
    [[ -f $skill_path/SKILL.md ]] || continue
    selected_skills+=("${skill_path##*/}")
  done
fi

install_for_runtime() {
  local selected_runtime=$1
  local target_root

  case $selected_runtime in
    codex)
      target_root=${CODEX_HOME:-$HOME/.codex}/skills
      ;;
    claude)
      target_root=$HOME/.claude/skills
      ;;
    *)
      printf 'Unsupported runtime: %s\n' "$selected_runtime" >&2
      return 2
      ;;
  esac

  mkdir -p "$target_root"

  local skill_name source_path destination current_target
  for skill_name in "${selected_skills[@]}"; do
    if [[ ! $skill_name =~ ^[a-z0-9-]+$ ]]; then
      printf 'Invalid skill name: %s\n' "$skill_name" >&2
      return 2
    fi

    source_path=$repo_root/skills/$skill_name
    if [[ ! -f $source_path/SKILL.md ]]; then
      printf 'Unknown skill: %s\n' "$skill_name" >&2
      return 1
    fi

    destination=$target_root/$skill_name
    if [[ -L $destination ]]; then
      current_target=$(readlink "$destination")
      if [[ $current_target == "$source_path" ]]; then
        printf 'Already linked: %s -> %s\n' "$destination" "$source_path"
        continue
      fi

      ln -sfn "$source_path" "$destination"
      printf 'Updated link: %s -> %s\n' "$destination" "$source_path"
      continue
    fi

    if [[ -e $destination ]]; then
      printf 'Refusing to overwrite non-symlink: %s\n' "$destination" >&2
      return 1
    fi

    ln -s "$source_path" "$destination"
    printf 'Linked: %s -> %s\n' "$destination" "$source_path"
  done

  if [[ $install_all == true ]]; then
    for destination in "$target_root"/*; do
      [[ -L $destination ]] || continue
      skill_name=${destination##*/}
      [[ $skill_name =~ ^[a-z0-9-]+$ ]] || continue

      source_path=$repo_root/skills/$skill_name
      current_target=$(readlink "$destination")
      [[ $current_target == "$source_path" ]] || continue
      [[ ! -f $source_path/SKILL.md ]] || continue

      rm -- "$destination"
      printf 'Removed stale link: %s -> %s\n' "$destination" "$source_path"
    done
  fi
}

case $runtime in
  codex | claude)
    install_for_runtime "$runtime"
    ;;
  all)
    install_for_runtime codex
    install_for_runtime claude
    ;;
  *)
    usage >&2
    exit 2
    ;;
esac
