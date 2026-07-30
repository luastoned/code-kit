#!/usr/bin/env python3

from __future__ import annotations

import html
import json
import os
import re
import shutil
import subprocess
import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]


class ValidationError(RuntimeError):
    pass


def run(command: list[str], *, capture: bool = False) -> str:
    result = subprocess.run(
        command,
        cwd=ROOT,
        check=False,
        text=True,
        stdout=subprocess.PIPE if capture else None,
        stderr=subprocess.PIPE if capture else None,
    )
    if result.returncode != 0:
        detail = result.stderr.strip() if capture else ''
        raise ValidationError(f"Command failed ({result.returncode}): {' '.join(command)}{f': {detail}' if detail else ''}")
    return result.stdout if capture else ''


def require_tool(name: str) -> str:
    path = shutil.which(name)
    if path is None:
        raise ValidationError(f'Required tool is unavailable: {name}')
    return path


def skill_directories() -> list[Path]:
    return sorted(path.parent for path in (ROOT / 'skills').glob('*/SKILL.md'))


def find_skill_validator() -> Path:
    candidates = []
    override = os.environ.get('SKILL_VALIDATOR')
    if override:
        candidates.append(Path(override).expanduser())

    codex_home = Path(os.environ.get('CODEX_HOME', Path.home() / '.codex')).expanduser()
    candidates.append(codex_home / 'skills/.system/skill-creator/scripts/quick_validate.py')

    for candidate in candidates:
        if candidate.is_file():
            return candidate.resolve()

    raise ValidationError('Cannot find skill-creator quick_validate.py; set SKILL_VALIDATOR to its path')


def validate_skills() -> None:
    validator = find_skill_validator()
    python = require_tool('python3')
    for skill_directory in skill_directories():
        run([python, str(validator), str(skill_directory)])


def parse_quoted_yaml_scalar(value: str, path: Path, key: str) -> str:
    if len(value) >= 2 and value[0] == value[-1] == "'":
        return value[1:-1].replace("''", "'")
    if len(value) >= 2 and value[0] == value[-1] == '"':
        try:
            parsed = json.loads(value)
        except json.JSONDecodeError as error:
            raise ValidationError(f'{path}: {key} contains invalid quoting') from error
        if isinstance(parsed, str):
            return parsed
    raise ValidationError(f'{path}: {key} must be a quoted string')


def parse_skill_metadata_sections(lines: list[str], path: Path) -> dict[str, list[str]]:
    supported_sections = {'interface', 'dependencies', 'policy'}
    sections: dict[str, list[str]] = {}
    current_section: str | None = None

    for line in lines:
        if not line.strip():
            continue
        if not line.startswith(' '):
            match = re.fullmatch(r'([a-z_]+):', line)
            if match is None:
                raise ValidationError(f'{path}: unsupported top-level metadata line: {line}')
            current_section = match.group(1)
            if current_section not in supported_sections:
                raise ValidationError(f'{path}: unsupported metadata section: {current_section}')
            if current_section in sections:
                raise ValidationError(f'{path}: duplicate metadata section: {current_section}')
            sections[current_section] = []
            continue
        if current_section is None:
            raise ValidationError(f'{path}: metadata value appears before a section: {line}')
        sections[current_section].append(line)

    if not sections or next(iter(sections)) != 'interface':
        raise ValidationError(f'{path}: expected interface as the first metadata section')
    return sections


def parse_invocation_policy(lines: list[str], path: Path) -> bool:
    policy: dict[str, bool] = {}
    for line in lines:
        match = re.fullmatch(r'  ([a-z_]+): (true|false)', line)
        if match is None:
            raise ValidationError(f'{path}: unsupported policy line: {line}')
        key, raw_value = match.groups()
        if key != 'allow_implicit_invocation':
            raise ValidationError(f'{path}: unsupported policy key: {key}')
        if key in policy:
            raise ValidationError(f'{path}: duplicate policy key: {key}')
        policy[key] = raw_value == 'true'

    if 'allow_implicit_invocation' not in policy:
        raise ValidationError(f'{path}: policy must define allow_implicit_invocation')
    return policy['allow_implicit_invocation']


def validate_skill_metadata() -> None:
    for skill_directory in skill_directories():
        path = skill_directory / 'agents/openai.yaml'
        if not path.is_file():
            raise ValidationError(f'Missing skill metadata: {path}')

        lines = path.read_text(encoding='utf-8').splitlines()
        sections = parse_skill_metadata_sections(lines, path)

        values: dict[str, str] = {}
        for line in sections['interface']:
            match = re.fullmatch(r'  ([a-z_]+): (.+)', line)
            if match is None:
                raise ValidationError(f'{path}: unsupported metadata line: {line}')
            key, raw_value = match.groups()
            if key in values:
                raise ValidationError(f'{path}: duplicate metadata key: {key}')
            values[key] = parse_quoted_yaml_scalar(raw_value, path, key)

        required = {'display_name', 'short_description', 'default_prompt'}
        missing = required - values.keys()
        if missing:
            raise ValidationError(f'{path}: missing metadata keys: {sorted(missing)}')
        if not 25 <= len(values['short_description']) <= 64:
            raise ValidationError(f'{path}: short_description must contain 25-64 characters')
        if f'${skill_directory.name}' not in values['default_prompt']:
            raise ValidationError(f'{path}: default_prompt must mention ${skill_directory.name}')

        policy_lines = sections.get('policy')
        if policy_lines is None:
            raise ValidationError(f'{path}: missing explicit invocation policy')

        if not parse_invocation_policy(policy_lines, path):
            skill_text = (skill_directory / 'SKILL.md').read_text(encoding='utf-8')
            description_match = re.search(r'^description: (.+)$', skill_text, re.MULTILINE)
            description = description_match.group(1) if description_match else ''
            if 'explicit' not in description.lower() or f'${skill_directory.name}' not in description:
                raise ValidationError(f'{path}: explicit-only policy must match the SKILL.md description')


def validate_json() -> None:
    paths = sorted((ROOT / 'configs').glob('*.json')) + sorted((ROOT / 'references').glob('*.json'))
    for path in paths:
        try:
            json.loads(path.read_text(encoding='utf-8'))
        except json.JSONDecodeError as error:
            raise ValidationError(f'Invalid JSON: {path}: {error}') from error


def validate_gitmojis() -> None:
    path = ROOT / 'references/gitmojis.json'
    document = json.loads(path.read_text(encoding='utf-8'))
    if document.get('$schema') != 'https://gitmoji.dev/api/gitmojis/schema':
        raise ValidationError(f'{path}: unexpected schema URL')

    entries = document.get('gitmojis')
    if not isinstance(entries, list):
        raise ValidationError(f'{path}: gitmojis must be an array')

    entity_pattern = re.compile(r'^(?:&#(?:x[0-9A-Fa-f]+|[0-9]+);)+$')

    def normalize(value: str) -> str:
        return value.replace('\ufe0f', '')

    for index, entry in enumerate(entries):
        name = entry.get('name', f'entry {index}')
        entity = entry.get('entity')
        emoji = entry.get('emoji')
        if not isinstance(entity, str) or entity_pattern.fullmatch(entity) is None:
            raise ValidationError(f'{path}: invalid entity for {name}: {entity!r}')
        if not isinstance(emoji, str) or normalize(html.unescape(entity)) != normalize(emoji):
            raise ValidationError(f'{path}: entity does not match emoji for {name}')

    for key in ('emoji', 'code', 'name'):
        values = [entry.get(key) for entry in entries]
        if len(values) != len(set(values)):
            raise ValidationError(f'{path}: duplicate {key} values')


def validate_markdown() -> None:
    for path in sorted(ROOT.rglob('*.md')):
        if '.git' in path.parts:
            continue
        text = path.read_text(encoding='utf-8')
        for target in re.findall(r'\[[^\]]*\]\(([^)]+)\)', text):
            target = target.strip('<>')
            if target.startswith(('http://', 'https://', '#')):
                continue
            destination = (path.parent / target.split('#', 1)[0]).resolve()
            if not destination.exists():
                raise ValidationError(f'{path}: missing local link target: {target}')

    readme = (ROOT / 'README.md').read_text(encoding='utf-8')
    navigation = set(re.findall(r'href="#([^"]+)"', readme))

    def slug(value: str) -> str:
        value = value.strip().lower()
        value = ''.join(character for character in value if character.isalnum() or character in ' -_')
        return re.sub(r' +', '-', value)

    headings = {slug(match.group(1)) for match in re.finditer(r'^#{1,6}\s+(.+?)\s*$', readme, re.MULTILINE)}
    missing = navigation - headings
    if missing:
        raise ValidationError(f'README navigation references missing headings: {sorted(missing)}')


def validate_cross_file_consistency() -> None:
    readme = (ROOT / 'README.md').read_text(encoding='utf-8')
    skills = {path.name for path in skill_directories()}
    catalog_match = re.search(r'^## 🧭 Skill Catalog\n\n(.*?)(?=^## )', readme, re.MULTILINE | re.DOTALL)
    if catalog_match is None:
        raise ValidationError('README is missing the skill catalog')
    cataloged = set(re.findall(r'^\| `\$([a-z0-9-]+)`\s+\|', catalog_match.group(1), re.MULTILINE))
    if cataloged != skills:
        raise ValidationError(f'README skill catalog coverage differs: missing={sorted(skills - cataloged)}, extra={sorted(cataloged - skills)}')

    entrypoint = (ROOT / 'guidance/AGENTS.md').read_text(encoding='utf-8')
    mapped = set(re.findall(r'^- `([^`]+\.md)`:', entrypoint, re.MULTILINE))
    public_guides = {path.name for path in (ROOT / 'guidance').glob('*.md') if path.name != 'AGENTS.md'}
    if mapped != public_guides:
        raise ValidationError(f'Public guidance mapping differs: missing={sorted(public_guides - mapped)}, extra={sorted(mapped - public_guides)}')

    license_text = (ROOT / 'LICENSE').read_text(encoding='utf-8')
    if '2026 [Gregor Steiner]' not in readme or 'Copyright (c) 2026 Gregor Steiner' not in license_text:
        raise ValidationError('README and LICENSE ownership differ')


def validate_text_files() -> None:
    visible = run(['git', 'ls-files', '-z', '--cached', '--others', '--exclude-standard'], capture=True).split('\0')
    for relative_path in visible:
        if not relative_path:
            continue
        path = ROOT / relative_path
        if not path.is_file():
            continue
        data = path.read_bytes()
        if not data or b'\0' in data:
            continue
        if not data.endswith(b'\n'):
            raise ValidationError(f'Text file lacks a final newline: {relative_path}')


def validate_tools() -> None:
    oxfmt = require_tool('oxfmt')
    oxlint = require_tool('oxlint')
    run([oxfmt, '-c', 'configs/.oxfmtrc.json', '--check', '.'])
    rendered = run([oxlint, '-c', 'configs/.oxlintrc.json', '--print-config'], capture=True)
    try:
        json.loads(rendered)
    except json.JSONDecodeError as error:
        raise ValidationError(f'Oxlint emitted an invalid effective config: {error}') from error

    run(['bash', '-n', 'scripts/install-skills.sh'])
    shellcheck = shutil.which('shellcheck')
    if shellcheck is not None:
        run([shellcheck, 'scripts/install-skills.sh'])
    else:
        print('SKIP: shellcheck is unavailable')


def main() -> int:
    checks = [
        ('skills', validate_skills),
        ('skill metadata', validate_skill_metadata),
        ('JSON', validate_json),
        ('Gitmoji reference', validate_gitmojis),
        ('Markdown', validate_markdown),
        ('cross-file consistency', validate_cross_file_consistency),
        ('text files', validate_text_files),
        ('external tools', validate_tools),
    ]

    try:
        for label, check in checks:
            check()
            print(f'PASS: {label}')
        run(['git', 'diff', '--check'])
        run(['git', 'diff', '--cached', '--check'])
        print('PASS: Git whitespace checks')
    except ValidationError as error:
        print(f'FAIL: {error}', file=sys.stderr)
        return 1

    print('Repository validation passed.')
    return 0


if __name__ == '__main__':
    raise SystemExit(main())
