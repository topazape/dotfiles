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

# Applications
## homebrew
if type brew > /dev/null 2>&1; then
	## gnu commands
	gnu_pkgs=("coreutils" "findutils" "grep" "gawk")
	for gnu_pkg in $gnu_pkgs; do
		if [[ -d "$(brew --prefix)/opt/$gnu_pkg/libexec/gnubin" ]]; then
			export PATH="$(brew --prefix)/opt/$gnu_pkg/libexec/gnubin":$PATH
			if [[ $gnu_pkg = "coreutils" ]]; then
				gnu_ls=true
			fi
		fi
	done
	### completions
	FPATH="$(brew --prefix)/share/zsh/site-functions":$FPATH
	autoload -Uz compinit
	compinit
fi
## CUDA
if type nvidia-smi > /dev/null 2>&1; then
	export __GL_SHADER_DISK_CACHE_PATH="$XDG_CACHE_HOME/nv"
	export CUDA_CACHE_PATH="$XDG_CACHE_HOME/nv"
fi
## Rust
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
if type pip3 > /dev/null 2>&1; then
	export PIP_CACHE_DIR="$XDG_CACHE_HOME/pip"
fi
## pipenv
if type pipenv > /dev/null 2>&1; then
	export PIPENV_CACHE_DIR="$XDG_CACHE_HOME/pipenv"
fi
## postgresql
export PSQLRC="$XDG_CONFIG_HOME/pg/psqlrc"
export PSQL_HISTORY="$XDG_CACHE_HOME/pg/psql_history"
export PGPASSFILE="$XDG_CONFIG_HOME/pg/pgpass"
export PGSERVICEFILE="$XDG_CONFIG_HOME/pg/pg_service.conf"

# less
export LESSHISTFILE=-


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

# ls
LS_COLORS="rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:"
case "$OSTYPE" in
	linux*)
		export LS_COLORS
		alias ls='ls -F --color=auto'
		alias ll='ls -lh'
		alias la='ls -A'
		alias less='less -i -x2 -N -R -M'
		;;
	darwin*)
		if [ $gnu_ls ]; then
			export LS_COLORS
			alias ls='ls -F --color=auto'
			alias ll='ls -lh'
			alias la='ls -A'
			alias less='less -i -x2 -N -R -M'
			unset gnu_ls
		else
			alias ls='ls -F -G'
			alias ll='ls -lh'
			alias la='ls -A'
		fi
esac
