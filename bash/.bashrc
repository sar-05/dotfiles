# shellcheck shell=bash
#
# ~/.bashrc
#

export EDITOR=nvim

_append_path() {
	case ":$PATH:" in
	*":$1:"*) ;;
	*) PATH="$PATH:$1" ;;
	esac
}
_append_path "$HOME/.local/bin"
_append_path "$HOME/.local/share/gem/ruby/3.4.0/bin"

export TRY_PATH="$HOME/Tries"
eval "$(try init ~/Tries)"

# bat colorscheme
export BAT_THEME=vague

# fzf config file
export FZF_DEFAULT_OPTS_FILE="${XDG_CONFIG_HOME}/fzf/opts"

# If not running interactively, don't source the next part
[[ $- != *i* ]] && return

set -o vi

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias gr='cd $(git rev-parse --show-toplevel)'
alias cat='bat'
alias get-conservation-mode='cat /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode'
# allow alias to be expanded when defined
# shellcheck disable=SC2139
alias wget=wget --hsts-file="${XDG_DATA_HOME}/wget-hsts"

PS1='$([ $? == 0 ] && echo "\[\033[0;35m\]" || echo "\[\033[0;31m\]")\u\[\033[0m\]@\h \W -> '

# less colors for man pages
export MANROFFOPT='-c'
export LESS_TERMCAP_mb=$'\e[1;31m'
export LESS_TERMCAP_md=$'\e[1;31m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[1;33;44m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[4;1;32m'
export LESS_TERMCAP_mr=$'\e[7m'
export LESS_TERMCAP_mh=$'\e[2m'
export LESS_TERMCAP_ZN=$'\e[74m'
export LESS_TERMCAP_ZV=$'\e[75m'
export LESS_TERMCAP_ZO=$'\e[73m'
export LESS_TERMCAP_ZW=$'\e[75m'
export MANPAGER='less'

# connect to a system instance of qemu-kvm hypervisor
export LIBVIRT_DEFAULT_URI='qemu:///system'

# screenshots directory for grim
export GRIM_DEFAULT_DIR="$HOME/Pictures/screenshots"
if [ -d "$GRIM_DEFAULT_DIR" ]; then
	mkdir -p "$GRIM_DEFAULT_DIR"
fi

# FZF integration for history
export FZF_ALT_C_OPTS="--walker dir,follow --preview 'tree -C {}'"
eval "$(fzf --bash)"

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

# Exit cleanly instead of hanging if foot terminal is in use
if [[ "$TERM" == 'foot' ]]; then
	trap 'exit 0' SIGHUP
fi
