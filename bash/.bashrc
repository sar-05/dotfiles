#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Source ble.sh in interactive sessions, but wait for atach signal
[[ $- == *i* ]] && source -- "${HOME}/.local/share/blesh/ble.sh" --attach=none

# Vi mode
# set -o vi

# Color prompt
# PS1='$(if [ $? -eq 0 ]; then echo "\[\033[0;36m\]"; else echo "\[\033[0;31m\]"; fi)[\w]\[\033[0m\]\$ '
# Default prompt
PS1='[\u@\h \W]\$ '

# Export XDG compliant history file
export HISTFILE="${XDG_STATE_HOME}"/bash/history
export HISTCONTROL="ignoredups"

# FZF integration
# eval "$(fzf --bash)"

# Aliases
alias ls='ls --color'
alias grep='grep --color=auto'
alias vim='nvim'
alias ff='custom_fastfetch'
alias yarn='yarn --use-yarnrc "$XDG_CONFIG_HOME/yarn/config"'
alias wget='wget --hsts-file="$XDG_DATA_HOME/wget-hsts"'
alias cat='bat'
alias man='batman'
alias dtree="pacman -Qq | fzf --preview 'pactree -lur {} | sort' --layout reverse --bind 'enter:execute(pactree -lu {} | sort | less)'"
alias vim=nvim
alias gr='cd $(git rev-parse --show-toplevel)'
alias cd='z'

# Yazi shell wrapper
function y() {
  #shellcheck disable=SC2155
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
  #shellcheck disable=SC2164
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

# Zoxide integration
eval "$(zoxide init bash)"

# Starship prompt
eval "$(starship init bash)"

# Oh-my-posh prompt
# eval "$(oh-my-posh init bash --config ${HOME}/.config/ohmyposh/base.toml)"

# Attach ble.sh after configuring bash
[[ ! ${BLE_VERSION-} ]] || ble-attach
