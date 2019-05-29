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
export LESSHISTFILE=-
## XDG
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

### XDG_ZSH_HISTORY
export HISTFILE="$XDG_DATA_HOME/zsh/history"

## CUDA
if type nvidia-smi > /dev/null 2>&1; then
	export __GL_SHADER_DISK_CACHE_PATH="$XDG_CACHE_HOME/nv"
	export CUDA_CACHE_PATH="$XDG_CACHE_HOME/nv"
fi

### LINUXBREW
if [ -e ~/.linuxbrew/bin/brew ]; then
	eval "$(~/.linuxbrew/bin/brew shellenv)"
	### completions
	#### site-functions
	if [ -d ~/.linuxbrew/share/zsh/site-functions ]; then
		fpath=(~/.linuxbrew/share/zsh/site-functions $fpath)
	fi
	#### sphinx
	if [ -d ~/.linuxbrew/opt/sphinx-doc/bin ]; then
		export PATH="$HOME/.linuxbrew/opt/sphinx-doc/bin:$PATH"
	fi
	#### pipenv
	if type pipenv > /dev/null 2>&1; then
		eval "$(pipenv --completion)"
	fi
	### direnv
	if type direnv > /dev/null 2>&1; then
		eval "$(direnv hook zsh)"
	fi
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
		;;
	darwin*)
		alias ls='ls -F -G'
		alias ll='ls -lh'
		alias la='ls -A'
		;;
esac
