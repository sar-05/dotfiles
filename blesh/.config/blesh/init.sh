bleopt default_keymap=vi
bleopt prompt_ps1_transient=always

# Colorscheme file
COLORSCHEME="${XDG_CONFIG_HOME:-$HOME/.config}/blesh/colorscheme.sh"

# Vi/vim mode settings (must go inside the function)
function blerc/vim-mode-hook {

bleopt keymap_vi_mode_show=

}
blehook/eval-after-load keymap_vi blerc/vim-mode-hook

# Cursor depending on vim mode
ble-bind -m vi_nmap --cursor 2
ble-bind -m vi_imap --cursor 5

# Accept suggestion incrementaly
ble-bind -m 'vi_imap' -f 'C-S-y' 'complete'
# Accept suggestion all at once
ble-bind -m 'auto_complete' -f 'C-y' 'auto_complete/@end insert'

# Use bash-completion, if available, and avoid double-sourcing
# [[ $PS1 &&
#   ! ${BASH_COMPLETION_VERSINFO:-} &&
#   -f /usr/share/bash-completion/bash_completion ]] &&
#     . /usr/share/bash-completion/bash_completion

# FZF integration, must be load by ble.sh if in use and
# completions must load before it
ble-import -d integration/fzf-completion
ble-import -d integration/fzf-key-bindings
ble-import -d integration/fzf-menu

# Colorscheme
[[ -f "${COLORSCHEME}" ]] && source "${COLORSCHEME}"
