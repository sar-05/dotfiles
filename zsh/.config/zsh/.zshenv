# ~/.zshenv - Loaded by ALL zsh shells (login, interactive, non-interactive)
# Environment variables that should be available everywhere

# XDG Base Directory Specification compliance
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"  
export XDG_CACHE_HOME="$HOME/.cache"

# Application-specific XDG compliance
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export DOTNET_CLI_HOME="$XDG_DATA_HOME/dotnet"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export IPYTHONDIR="$XDG_CONFIG_HOME/ipython"
export NIMBLE_DIR="$XDG_DATA_HOME/nimble"

# npm configuration (requires creating ~/.npmrc file with XDG paths)
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export NPM_CONFIG_CACHE="$XDG_CACHE_HOME/npm"

# tmux configuration (requires modifying tmux.conf)
export TMUX_PLUGIN_MANAGER_PATH="$XDG_DATA_HOME/tmux/plugins"

# yarn configuration (requires alias: yarn --use-yarnrc $XDG_CONFIG_HOME/yarn/config)
export YARN_CACHE_FOLDER="$XDG_CACHE_HOME/yarn"

# wget configuration (requires alias: wget --hsts-file="$XDG_DATA_HOME/wget-hsts")
export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"

# General environment variables
export EDITOR=nvim
export GCM_CREDENTIAL_STORE=secretservice
export GOPATH="$XDG_CONFIG_HOME/go"

# Disabled files
export LESSHISTFILE=-

# Update PATH (append local bin if not already present)
case ":$PATH:" in
    *":$HOME/.local/bin:"*) ;;
    *) export PATH="$PATH:$HOME/.local/bin" ;;
esac
