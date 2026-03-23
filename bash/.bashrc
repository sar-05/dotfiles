# shellcheck shell=bash
#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

set -o vi

alias ls='ls --color=auto'
alias grep='grep --color=auto'
# allow alias to be expanded when defined
# shellcheck disable=SC2139
alias wget=wget --hsts-file="${XDG_DATA_HOME}/wget-hsts"
alias gr='cd $(git rev-parse --show-toplevel)'
alias cat='bat -p'
PS1='$([ $? == 0 ] && echo "\[\033[0;35m\]" || echo "\[\033[0;31m\]")\u\[\033[0m\]@\h \W -> '

# FZF integration for history
export FZF_ALT_C_OPTS="--walker dir,follow --preview 'tree -C {}'"
eval "$(fzf --bash)"

alias gcb="git branch | \
  fzf --preview 'git show --color=always {-1}' \
      --bind 'enter:become(git checkout {-1})' \
      --height 40% \
      --layout reverse"

# shell wrapper to change the current working directory when exiting Yazi
function y() {
  local tmp cwd
  tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
  command yazi "$@" --cwd-file="$tmp"
  IFS= read -r -d '' cwd <"$tmp"
  [ "$cwd" != "$PWD" ] && [ -d "$cwd" ] &&
    { builtin cd -- "$cwd" || return 1; }
  rm -f -- "$tmp"
}

# wrapper for zathura pdf
function pdf() {
  if ! which zathura >/dev/null 2>&1; then
    echo 'Unable to find Zathura PDF binary'
    return 1
  fi

  local files=()
  for f in "$@"; do
    # let *.pdf unquoted to use globs instead of regex
    [[ "$f" == *.pdf ]] && files+=("$f")
  done

  if [[ ${#files[@]} -gt 0 ]]; then
    zathura "${files[@]}" &
    disown "$!"
  else
    echo "Not given any valid PDF files"
    return 1
  fi
}
