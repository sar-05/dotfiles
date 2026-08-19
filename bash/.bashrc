# shellcheck shell=bash
#
# ~/.bashrc
#

_append_path() {
	case ":$PATH:" in
	*":$1:"*) ;;
	*) PATH="$PATH:$1" ;;
	esac
}


_prepend_path() {
	case ":$PATH:" in
	*":$1:"*) ;;
	*) PATH="$1:$PATH" ;;
	esac
}

_append_path "${HOME}/.local/bin"
_append_path "${XDG_DATA_HOME}/uv/tools/qmk/bin"

# If not running interactively, don't source the next part
[[ $- != *i* ]] && return

set -o vi

if command -v nvim >/dev/null;then
  export EDITOR=nvim
fi

if command -v bat >/dev/null; then
  export BAT_THEME=vague
  export LESSCOLORIZER='bat --color=always --style=plain'
fi

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias gr='cd $(git rev-parse --show-toplevel)'
alias tldr='tldr --pager'
alias get-conservation-mode='cat /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode'
# allow alias to be expanded when defined
# shellcheck disable=SC2139
alias wget=wget --hsts-file="${XDG_DATA_HOME}/wget-hsts"

# interactive prompt coloring based on last exit code
PROMPT_DIRTRIM=2
PROMPT_COMMAND='PS1="\[\e[01;32m\]\u@\h \[$([ $? -eq 0 ] && echo "\e[34m" || echo "\e[31m")\]\w \$\[\e[0m\] "'

# connect to a system instance of qemu-kvm hypervisor
if command -v qemu-system-x86_64 >/dev/null; then
  export LIBVIRT_DEFAULT_URI='qemu:///system'
fi

# screenshots directory for grim
if command -v grim >/dev/null; then
  export GRIM_DEFAULT_DIR="$HOME/Pictures/screenshots"
fi

if [ -n "${GRIM_DEFAULT_DIR}" ] && [ ! -d "$GRIM_DEFAULT_DIR" ]; then
	mkdir -p "$GRIM_DEFAULT_DIR"
fi

# FZF integration
if command -v fzf >/dev/null; then
  export FZF_DEFAULT_OPTS_FILE="${XDG_CONFIG_HOME}/fzf/opts"
  export FZF_ALT_C_OPTS="--walker dir,follow --preview 'tree -C {}'"
  eval "$(fzf --bash)"
fi

# default zk notebook
if command -v zk >/dev/null; then
export ZK_NOTEBOOK_DIR="${HOME}/Documents/notebook"
fi

# opencode binary
if command -v opencode >/dev/null; then
  export PATH=/home/sar/.opencode/bin:$PATH
fi

source ~/Repos/qmk_firmware/util/qmk_tab_complete.sh

# shell wrapper to change the current working directory when exiting Yazi
command -v yazi >/dev/null && function y() {
	local tmp cwd
	tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd <"$tmp"
	[ "$cwd" != "$PWD" ] && [ -d "$cwd" ] &&
		{ builtin cd -- "$cwd" || return 1; }
	rm -f -- "$tmp"
}

toggle_localrust(){
  local status='disaled'
  local rustup_path="${HOME}/.local/share/cargo/bin"

  if [ "${PATH}" == "${rustup_path}"* ]; then
    PATH="${PATH//${rustup_path}:}"
  else
    _prepend_path "${rustup_path}"
    status='enabled'
  fi

  echo "localrust ${status}"
}

# Exit cleanly instead of hanging if foot terminal is in use
if [ "${TERM}" == 'foot' ]; then
	trap 'exit 0' SIGHUP
fi

