## Shell history
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
HISTDUP=erase
setopt=appendhistory
setopt=sharehistory
#History ignores commands prepended with space
setopt=hist_ignore_space
#Options to ignore dups in history
setopt=hist_ignore_all_dups
setopt=hist_save_no_dups
setopt=hist_ignore_dups
setopt=hist_find_no_dups

##Misc
#Disable bell sound
unsetopt beep

#Keybindings
#Set vi mode
bindkey -v
#Smart history search
bindkey -M vicmd 'k' history-search-backward
bindkey -M vicmd 'j' history-search-forward
bindkey -M vicmd 'C' clear-screen

##Completions
# Basic completion options
setopt autocd extendedglob nomatch
zstyle :compinstall filename '/home/sar/.zshrc'
autoload -U compinit; compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

##Aliases
#Added for colors
alias ls='ls --color'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
alias update='sudo pacman -Syu && yay -Syu && flatpak update'

##Plugins
# FZF integration
eval "$(fzf --zsh)"
#fzf-tab requires cloning repo into zsh plugins folder
source /usr/share/zsh/plugins/fzf-tab/fzf-tab.plugin.zsh
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
#Disable default completion menu for compatibility
zstyle ':completion:*' menu no
#Autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh
#Added for zsh-syntax-highlighting, this should go at the end
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#Starship prompt
export STARSHIP_CONFIG=~/.config/starship/starship.toml
eval "$(starship init zsh)"
