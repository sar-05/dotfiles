# shellcheck shell=bash
# XDG env variables
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
export XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"
export XDG_RUNTIME_DIR="/run/user/$UID"
export XDG_DATA_DIRS='/usr/local/share:/usr/share'

# Application-specific XDG compliance
export CARGO_HOME="${XDG_DATA_HOME}/cargo"
export GNUPGHOME="${XDG_DATA_HOME}/gnupg"
export LESSHISTFILE="${XDG_STATE_HOME}/less/history"
export NPM_CONFIG_USERCONFIG="${XDG_CONFIG_HOME}/npm/npmrc"
export NPM_CONFIG_CACHE="${XDG_CACHE_HOME}/npm"
export WGETRC="${XDG_CONFIG_HOME}/wget/wgetrc"
export HISTFILE="${XDG_STATE_HOME}/bash/history"
export GOPATH="${XDG_CONFIG_HOME}/go"
export UNISON="${XDG_DATA_HOME}/unison"
export INPUTRC="$XDG_CONFIG_HOME"/readline/inputrc

# mpc variable for custom mpd socket
export MPD_HOST=/tmp/mpd_socket

# set socket for ssh agent if not logged in remotely
if [ -z "${SSH_CONNECTION}" ]; then
	export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
fi

source ~/.bashrc
