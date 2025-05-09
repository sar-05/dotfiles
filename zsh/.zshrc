#Starship prompt
export STARSHIP_CONFIG=~/.config/starship/starship.toml
eval "$(starship init zsh)"

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

#Autocd
setopt autocd

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::aws
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

#Keybindings
bindkey -v
bindkey -M vicmd 'k' history-search-backward
bindkey -M vicmd 'j' history-search-forward
bindkey -M vicmd 'C' clear-screen
bindkey '^[w' kill-region

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Aliases
alias ls='ls --color'
alias vim='nvim'
alias update='sudo pacman -Syu && yay -Syu && flatpak update'

#Custom clipcat integration
# Function to select from clipcat and insert at cursor
clipboard_insert_at_cursor() {
  # Run clipcat-menu to select an item (puts it on clipboard)
  clipcat-menu --finder=builtin insert
  
  # Store current cursor position
  local cursor_pos=$CURSOR
  
  # For Vi mode compatibility - if in command mode, enter insert mode first
  if [[ $KEYMAP == vicmd ]]; then
    zle vi-insert
  fi
  
  # Simulate paste at cursor position
  LBUFFER+="$(xclip -selection clipboard -o 2>/dev/null || wl-paste 2>/dev/null || pbpaste 2>/dev/null)"
  
  # Redraw the prompt
  zle reset-prompt
}

# Register as a ZLE widget
zle -N clipboard_insert_at_cursor

# Bind in both Vi modes
bindkey -M vicmd '^\' clipboard_insert_at_cursor
bindkey -M viins '^\' clipboard_insert_at_cursor

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
