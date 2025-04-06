#
# ~/.bashrc
#
#Added for ble.sh
#[[ $- == *i* ]] && source /usr/share/blesh/ble.sh --attach=none
[[ $- == *i* ]] && source "$HOME/.blerc" --noattach
# If not running interactively, don't do anything
[[ $- != *i* ]] && return
alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
export EDITOR=nvim
#Added for vim mode
set -o vi
#Commands prefixed with a space won't be saved in history
HISTCONTROL=ignorespace
#Also added for ble.sh
#[[ ${BLE_VERSION-} ]] && ble-attach
[[ ! ${BLE_VERSION-} ]] || ble-attach
