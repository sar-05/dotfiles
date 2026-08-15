# shellcheck shell=bash
# XDG env variables
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
export XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"
export XDG_RUNTIME_DIR="${XDG_RUNTIME_DIR:-/run/user/$UID}"
export XDG_DATA_DIRS="${XDG_DATA_DIRS:-/usr/local/share:/usr/share}"

# Application-specific XDG compliance
if command -v cargo >/dev/null; then
	export CARGO_HOME="${XDG_DATA_HOME}/cargo"
fi
if command -v gpg >/dev/null; then
	export GNUPGHOME="${XDG_DATA_HOME}/gnupg"
fi
if command -v less >/dev/null; then
	export LESSHISTFILE="${XDG_STATE_HOME}/less/history"
fi
if command -v npm >/dev/null; then
	export NPM_CONFIG_USERCONFIG="${XDG_CONFIG_HOME}/npm/npmrc"
	export NPM_CONFIG_CACHE="${XDG_CACHE_HOME}/npm"
fi
if command -v wget >/dev/null; then
	export WGETRC="${XDG_CONFIG_HOME}/wget/wgetrc"
fi
export HISTFILE="${XDG_STATE_HOME}/bash/history"
if command -v go >/dev/null; then
	export GOPATH="${XDG_CONFIG_HOME}/go"
fi
if command -v unison >/dev/null; then
	export UNISON="${XDG_DATA_HOME}/unison"
fi
if command -v rustup >/dev/null; then
	export RUSTUP_HOME="${XDG_DATA_HOME}/rustup"
fi
if command -v w3m >/dev/null; then
	export W3M_DIR="${XDG_DATA_HOME}/w3m"
fi

export INPUTRC="${XDG_CONFIG_HOME}/readline/inputrc"
export XCURSOR_PATH="${XDG_DATA_HOME}/icons"

# mpd music directory and unix socket
if command -v mpd >/dev/null; then
	export XDG_MUSIC_DIR="${HOME}/Music"
	export MPD_HOST="${XDG_RUNTIME_DIR}/mpd/socket"
fi

# set socket for ssh agent if not logged in remotely
if [ -z "${SSH_CONNECTION}" ]; then
	export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
fi

# source .bashrc if it exists
[ -f "${HOME}/.bashrc" ] && . "${HOME}/.bashrc"
