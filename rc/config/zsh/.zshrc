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

# XDG
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
## XDG_ZSH_HISTORY
export HISTFILE="$XDG_DATA_HOME/zsh/history"
export SAVEHIST=100000
## postgresql
export PSQLRC="$XDG_CONFIG_HOME/pg/psqlrc"
export PSQL_HISTORY="$XDG_CACHE_HOME/pg/psql_history"
export PGPASSFILE="$XDG_CONFIG_HOME/pg/pgpass"
export PGSERVICEFILE="$XDG_CONFIG_HOME/pg/pg_service.conf"
## CUDA
if type nvidia-smi > /dev/null 2>&1; then
	export __GL_SHADER_DISK_CACHE_PATH="$XDG_CACHE_HOME/nv"
	export CUDA_CACHE_PATH="$XDG_CACHE_HOME/nv"
fi
## rust
if type rustc > /dev/null 2>&1; then
	RUST_VERSION=`rustc --version |cut -d' ' -f 2`
	if [ -d "$XDG_DATA_HOME/rust/src/rust-$RUST_VERSION" ]; then
		export RUST_SRC_PATH="$XDG_DATA_HOME/rust/src/rust-$RUST_VERSION/library"
	fi
	unset RUST_VERSION
fi
### cargo
export CARGO_HOME="$XDG_DATA_HOME/cargo"
if [ -d "$CARGO_HOME/bin" ]; then
	export PATH="$CARGO_HOME/bin":$PATH
fi
## pip
if [[ $OSTYPE = darwin* ]] && [[ -e "$XDG_CONFIG_HOME/pip/pip.conf" ]]; then
	export PIP_CONFIG_FILE="$XDG_CONFIG_HOME/pip/pip.conf"
fi
# less
export LESSHISTFILE=-
## completions
if type brew > /dev/null 2>&1; then
	FPATH="$(brew --prefix)/share/zsh/site-functions":$FPATH
	autoload -Uz compinit
	compinit
fi

# direnv
if type direnv > /dev/null 2>&1; then
	eval "$(direnv hook zsh)"
fi

# EDITOR
if type nvim > /dev/null 2>&1; then
	export EDITOR="nvim"
fi

# zsh-prezto
## disable safe redirection
setopt clobber

# aliases
if type wget > /dev/null 2>&1; then
	alias wget='wget --no-hsts'
fi
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
