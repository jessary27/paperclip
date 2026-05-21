#!/usr/bin/env bash
# paperclip quality gate — runs on Stop. Validates SoT file integrity.
# SoT files for paperclip: AGENTS.md, CONTRIBUTING.md, src/
set -euo pipefail

INPUT="$(cat)"
CWD="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"
WARNINGS=()

# Check that SoT files exist and are not empty
SOT_FILES=(
  "AGENTS.md"
  "CONTRIBUTING.md"
)

for file in "${SOT_FILES[@]}"; do
  full_path="${CWD}/${file}"
  if [ ! -f "$full_path" ]; then
    WARNINGS+=("Missing SoT file: ${file}")
  elif [ ! -s "$full_path" ]; then
    WARNINGS+=("Empty SoT file: ${file} (may indicate accidental truncation)")
  fi
done

# Verify src/ directory is not empty (no accidental mass deletion)
if [ -d "${CWD}/src" ]; then
  SRC_COUNT=$(find "${CWD}/src" -type f 2>/dev/null | wc -l | tr -d ' ')
  if [ "$SRC_COUNT" -eq 0 ]; then
    WARNINGS+=("src/ directory is empty — possible accidental deletion")
  fi
fi

# Check for uncommitted changes to SoT files
STAGED_SOT=$(git -C "$CWD" diff --cached --name-only -- "${SOT_FILES[@]}" 2>/dev/null || true)
if [ -n "$STAGED_SOT" ]; then
  WARNINGS+=("Staged SoT changes — confirm these are intentional: ${STAGED_SOT}")
fi

# Report warnings as system message
if [ "${#WARNINGS[@]}" -gt 0 ]; then
  WARNING_MSG=$(printf '%s\n' "${WARNINGS[@]}" | sed 's/^/  • /')
  jq -n --arg msg "paperclip quality gate: ${#WARNINGS[@]} warning(s):\n${WARNING_MSG}" \
    '{"systemMessage": $msg}'
fi

exit 0
