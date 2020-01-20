#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
## proxy
if [ "$(uname -s)" = "Linux" ]; then
	export LANG=en_US.UTF-8
	if [ -e /etc/lsb-release ]; then
		export HTTP_PROXY="172.20.131.3:8065"
		export http_proxy="http://172.20.131.3:8065"
		export HTTPS_PROXY="172.20.131.3:8065"
		export https_proxy="https://172.20.131.3:8065"
	fi
fi
## less
export LESSHISTFILE=-
## XDG
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
### XDG_ZSH_HISTORY
export HISTFILE="$XDG_DATA_HOME/zsh/history"
export SAVEHIST=100000
## CUDA
if type nvidia-smi > /dev/null 2>&1; then
	export __GL_SHADER_DISK_CACHE_PATH="$XDG_CACHE_HOME/nv"
	export CUDA_CACHE_PATH="$XDG_CACHE_HOME/nv"
fi
## direnv
if type direnv > /dev/null 2>&1; then
	eval "$(direnv hook zsh)"
fi
## EDITOR
if type nvim > /dev/null 2>&1; then
	export EDITOR="nvim"
fi

## zsh-prezto
### disable safe redirection
setopt clobber

## aliases
alias wget='wget --no-hsts'
case "$OSTYPE" in
	linux*)
		alias ls='ls -F --color=auto'
		alias ll='ls -lh'
		alias la='ls -A'
		alias less='less -i -x2 -N -R -M'
		alias vim=$EDITOR
		;;
	darwin*)
		alias ls='ls -F -G'
		alias ll='ls -lh'
		alias la='ls -A'
		;;
esac
