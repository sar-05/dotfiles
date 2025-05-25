# ~/.zprofile - Login shell configuration
# This file is sourced by login shells only
# Environment variables are defined in .zshenv (loaded by all shells)

# Import environment variables into systemd for user services
# This only needs to happen once during login
if command -v systemctl &>/dev/null; then
    systemctl --user import-environment \
        XDG_CONFIG_HOME \
        XDG_DATA_HOME \
        XDG_STATE_HOME \
        XDG_CACHE_HOME \
        CARGO_HOME \
        DOTNET_CLI_HOME \
        GNUPGHOME \
        IPYTHONDIR \
        NIMBLE_DIR \
        NPM_CONFIG_USERCONFIG \
        NPM_CONFIG_CACHE \
        NPM_CONFIG_TMP \
        TMUX_PLUGIN_MANAGER_PATH \
        YARN_CACHE_FOLDER \
        WGETRC \
        EDITOR \
        GCM_CREDENTIAL_STORE \
        GOPATH \
        PATH \
        2>/dev/null || true
fi
