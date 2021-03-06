ZSH_CONFIG=~/config/zsh

#zmodload zsh/zprof

source $ZSH_CONFIG/antigen.zsh

# Plugins

antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle mafredri/zsh-async
antigen bundle sindresorhus/pure

antigen apply

# Manual plugin
source $ZSH_CONFIG/zsh-history-substring-search/zsh-history-substring-search.zsh

bindkey '^J' history-substring-search-up
bindkey '^K' history-substring-search-down

# Set up the prompt
#autoload -Uz promptinit
#promptinit
# prompt pure

setopt histignorealldups sharehistory

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# Aliases

alias ls='ls --color=auto'
alias ll='ls -lah --color=auto'
alias ws='cd ~/workspaces'
alias llr='ls -lah --color=always | less -r'

export TERM=xterm-256color

#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# zprof

