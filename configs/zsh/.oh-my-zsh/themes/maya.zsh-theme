# custom.zsh-theme
# Converted from oh-my-posh custom.json
#
# Colors (approximated from the hex values in the original theme):
#   Path:       #d3869b  → magenta/pink  → %F{211}
#   Git:        #83a598  → teal/cyan     → %F{109}
#   Git parens: #665c54  → dark brown    → %F{59}
#   Python:     #fabd2f  → yellow        → %F{214}
#   Py parens:  #655c54  → dark brown    → %F{59}
#   Text/›:     #ddc7a1  → light tan     → %F{223}
#   Error ›:    #fb4934  → red           → %F{196}

# ── Git info ─────────────────────────────────────────────────────────────────

function _custom_git_info() {
  local branch
  branch=$(git symbolic-ref --short HEAD 2>/dev/null) || \
  branch=$(git rev-parse --short HEAD 2>/dev/null)    || \
  return

  echo -n " %F{59}(%f%F{109}${branch}%f%F{59})%f"
}

# ── Python venv ───────────────────────────────────────────────────────────────

function _custom_venv_info() {
  [[ -z "$VIRTUAL_ENV" ]] && return
  local venv_name="${VIRTUAL_ENV:t}"
  echo -n "%F{59}(%f%F{214}${venv_name}%f%F{59})%f "
}

# ── Path (agnoster_short style) ───────────────────────────────────────────────
#
# Shows:
#   /                     → /
#   ~                     → ~
#   ~/foo                 → ~/foo
#   /foo                  → /foo
#   ~/foo/bar/baz         → ~/../baz
#   /foo/bar/baz          → /../baz

function _custom_path() {
  local full="${PWD}"
  local home="${HOME}"

  # Edge cases: exactly at / or ~
  if [[ "${full}" == "/" ]]; then
    echo -n "%F{211}/%f"
    return
  elif [[ "${full}" == "${home}" ]]; then
    echo -n "%F{211}~%f"
    return
  fi

  # Determine prefix and the path components beneath it
  local prefix remainder
  if [[ "${full}" == "${home}/"* ]]; then
    prefix="~"
    remainder="${full#${home}/}"
  else
    prefix=""
    remainder="${full#/}"
  fi

  # Split remainder into components
  local -a parts
  parts=("${(@s:/:)remainder}")
  local cwd="${parts[-1]}"

  if [[ ${#parts[@]} -le 1 ]]; then
    # Only one level below the prefix: ~/foo or /foo
    echo -n "%F{211}${prefix:+${prefix}/}${cwd}%f"
  else
    # Deeply nested: ~/../cwd or /../cwd
    echo -n "%F{211}${prefix}/../${cwd}%f"
  fi
}

# ── Prompt character ──────────────────────────────────────────────────────────

function _custom_prompt_char() {
  echo -n "%(?.%F{223}.%F{196})›%f "
}

# ── Assemble PROMPT ───────────────────────────────────────────────────────────

setopt PROMPT_SUBST

PROMPT=' $(_custom_path)$(_custom_git_info) $(_custom_venv_info)$(_custom_prompt_char)'

RPROMPT=''
