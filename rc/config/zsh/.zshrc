#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
## XDG
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

export EDITOR="nvim"
export HISTFILE="$XDG_DATA_HOME/zsh/history"

## Zsh-Prezto
### disable safe redirection
setopt clobber

## CUDA
export __GL_SHADER_DISK_CACHE_PATH="$XDG_CACHE_HOME/nv"
export CUDA_CACHE_PATH="$XDG_CACHE_HOME/nv"

## linuxbrew
eval $(~/.linuxbrew/bin/brew shellenv)
## direnv
eval "$(direnv hook zsh)"

## aliases
alias ls='ls -F --color=auto'
alias ll='ls -lh'
alias la='ls -A'
