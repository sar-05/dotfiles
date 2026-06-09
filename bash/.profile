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

# desktop for xdg-autostart
export XDG_CURRENT_DESKTOP=sway

# editor
export EDITOR=nvim

# fzf config file
export FZF_DEFAULT_OPTS_FILE="${XDG_CONFIG_HOME}/fzf/opts"

# mpc variable for custom mpd socket
export MPD_HOST=/tmp/mpd_socket

# connect to a system instance of qemu-kvm hypervisor
export LIBVIRT_DEFAULT_URI='qemu:///system'

# set socket for ssh agent if not logged in remotely
if [ -z "${SSH_CONNECTION}" ]; then
  export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
fi

# Define idempotent function to append to PATH
_append_path() {
  case ":$PATH:" in
  *":$1:"*) ;;
  *) PATH="$PATH:$1" ;;
  esac
}
_append_path "$HOME/.local/bin"
_append_path "$HOME/.local/share/gem/ruby/3.4.0/bin"
