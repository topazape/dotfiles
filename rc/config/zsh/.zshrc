#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#
#

# XDG
export XDG_CONFIG_HOME=${HOME}/.config
export XDG_CACHE_HOME=${HOME}/.cache
export XDG_DATA_HOME=${HOME}/.local/share

## terminfo
export TERMINFO=${XDG_DATA_HOME}/terminfo
export TERMINFO_DIRS=${XDG_DATA_HOME}/terminfo:/usr/share/terminfo
if infocmp ${TERM} |/usr/bin/grep "[sr]itm" > /dev/null; then
	:
elif infocmp xterm-256color-italic > /dev/null 2>&1; then
	export TERM="xterm-256color-italic"
else
	perl -e 'use File::Temp qw/ tempfile /; my ($fh, $fn) = tempfile(UNLINK => 1); print $fh "xterm-256color-italic|xterm with 256 colors and italic,\n\tsitm=\\E[3m, ritm=\\E[23m,\n\tuse=xterm-256color,\n"; close $fh; my @cmd = ("tic", $fn); system(@cmd);'
	export TERM="xterm-256color-italic"
fi

## XDG_ZSH_HISTORY
export HISTFILE=${XDG_DATA_HOME}/zsh/history
export SAVEHIST=100000

# Prezto
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
	source ${ZDOTDIR:-$HOME}/.zprezto/init.zsh
fi
## disable safe redirection
setopt clobber

# EDITOR
if type nvim > /dev/null 2>&1; then
	export EDITOR="nvim"
fi

# Applications
## less
if type less > /dev/null 2>&1; then
	export LESSHISTFILE=-
fi
## CUDA
if type nvidia-smi > /dev/null 2>&1; then
	export __GL_SHADER_DISK_CACHE_PATH=${XDG_CACHE_HOME}/nv
	export CUDA_CACHE_PATH=${XDG_CACHE_HOME}/nv
fi
## homebrew
if type brew > /dev/null 2>&1; then
	if [[ $OSTYPE = darwin* ]]; then
		export HOMEBREW_CACHE=${XDG_CACHE_HOME}/Homebrew
	fi
	## gnu commands
	gnu_pkgs=("coreutils" "findutils" "grep" "gawk" "gnu-sed" "gnu-tar")
	for gnu_pkg in ${gnu_pkgs[@]}; do
		if [[ -d "$(brew --prefix)/opt/${gnu_pkg}/libexec/gnubin" ]]; then
			export PATH="$(brew --prefix)/opt/${gnu_pkg}/libexec/gnubin":${PATH}
			if [[ ${gnu_pkg} = "coreutils" ]]; then
				gnu_ls=true
			fi
		fi
	done
	### completions
	FPATH="$(brew --prefix)/share/zsh/site-functions":${FPATH}
	autoload -Uz compinit
	compinit
fi
## PostgreSQL
if type psql > /dev/null 2>&1; then
	export PSQLRC=${XDG_CONFIG_HOME}/pg/psqlrc
	export PSQL_HISTORY=${XDG_CACHE_HOME}/pg/psql_history
	export PGPASSFILE=${XDG_CONFIG_HOME}/pg/pgpass
	export PGSERVICEFILE=${XDG_CONFIG_HOME}/pg/pg_service.conf
fi
## pspg
if type pspg > /dev/null 2>&1; then
	mkdir -p ${XDG_CACHE_HOME}/pspg
	export PSPG="-s 22"
	export PSPG_HISTORY=${XDG_CACHE_HOME}/pspg/pspg_history
fi
## direnv
if type direnv > /dev/null 2>&1; then
	eval "$(direnv hook zsh)"
fi

# Programing Languages
## Rust
if type rustup-init > /dev/null 2>&1; then
	### rustup
	export RUSTUP_HOME=${XDG_DATA_HOME}/rustup
	#### assign to an array to expand wildcard
	rust_src_path=(${RUSTUP_HOME}/toolchains/*/lib/rustlib/src/rust/library)
	export RUST_SRC_PATH=${rust_src_path[1]}
	unset rust_src_path
	### cargo
	export CARGO_HOME=${XDG_DATA_HOME}/cargo
	if [[ -e "${CARGO_HOME}/env" ]]; then
		source ${CARGO_HOME}/env
	fi
fi
## Python
### pip
if [[ $OSTYPE = darwin* ]] && [[ -e "${XDG_CONFIG_HOME}/pip/pip.conf" ]]; then
	export PIP_CONFIG_FILE=${XDG_CONFIG_HOME}/pip/pip.conf
fi
if type pip3 > /dev/null 2>&1; then
	export PIP_CACHE_DIR=${XDG_CACHE_HOME}/pip
fi
### pipenv
if type pipenv > /dev/null 2>&1; then
	export PIPENV_CACHE_DIR=${XDG_CACHE_HOME}/pipenv
fi
## npm
if type npm > /dev/null 2>&1; then
	export NPM_CONFIG_USERCONFIG=${XDG_CONFIG_HOME}/npm/npmrc
fi

# ls
## LS_COLORS
if type vivid > /dev/null 2>&1; then
	LS_COLORS="$(vivid generate snazzy)"
else
	LS_COLORS="no=00;38;5;244:rs=0:di=00;38;5;33:ln=01;38;5;37:mh=00:pi=48;5;230;38;5;136;01:so=48;5;230;38;5;136;01:do=48;5;230;38;5;136;01:bd=48;5;230;38;5;244;01:cd=48;5;230;38;5;244;01:or=48;5;235;38;5;160:su=48;5;160;38;5;230:sg=48;5;136;38;5;230:ca=30;41:tw=48;5;64;38;5;230:ow=48;5;235;38;5;33:st=48;5;33;38;5;230:ex=01;38;5;64:*.tar=00;38;5;61:*.tgz=01;38;5;61:*.arj=01;38;5;61:*.taz=01;38;5;61:*.lzh=01;38;5;61:*.lzma=01;38;5;61:*.tlz=01;38;5;61:*.txz=01;38;5;61:*.zip=01;38;5;61:*.zst=01;38;5;61:*.z=01;38;5;61:*.Z=01;38;5;61:*.dz=01;38;5;61:*.gz=01;38;5;61:*.lz=01;38;5;61:*.xz=01;38;5;61:*.bz2=01;38;5;61:*.bz=01;38;5;61:*.tbz=01;38;5;61:*.tbz2=01;38;5;61:*.tz=01;38;5;61:*.deb=01;38;5;61:*.rpm=01;38;5;61:*.jar=01;38;5;61:*.rar=01;38;5;61:*.ace=01;38;5;61:*.zoo=01;38;5;61:*.cpio=01;38;5;61:*.7z=01;38;5;61:*.rz=01;38;5;61:*.apk=01;38;5;61:*.gem=01;38;5;61:*.jpg=00;38;5;136:*.JPG=00;38;5;136:*.jpeg=00;38;5;136:*.gif=00;38;5;136:*.bmp=00;38;5;136:*.pbm=00;38;5;136:*.pgm=00;38;5;136:*.ppm=00;38;5;136:*.tga=00;38;5;136:*.xbm=00;38;5;136:*.xpm=00;38;5;136:*.tif=00;38;5;136:*.tiff=00;38;5;136:*.png=00;38;5;136:*.PNG=00;38;5;136:*.svg=00;38;5;136:*.svgz=00;38;5;136:*.mng=00;38;5;136:*.pcx=00;38;5;136:*.dl=00;38;5;136:*.xcf=00;38;5;136:*.xwd=00;38;5;136:*.yuv=00;38;5;136:*.cgm=00;38;5;136:*.emf=00;38;5;136:*.eps=00;38;5;136:*.CR2=00;38;5;136:*.ico=00;38;5;136:*.nef=00;38;5;136:*.NEF=00;38;5;136:*.webp=00;38;5;136:*.tex=01;38;5;245:*.rdf=01;38;5;245:*.owl=01;38;5;245:*.n3=01;38;5;245:*.ttl=01;38;5;245:*.nt=01;38;5;245:*.torrent=01;38;5;245:*.xml=01;38;5;245:*Makefile=01;38;5;245:*Rakefile=01;38;5;245:*Dockerfile=01;38;5;245:*build.xml=01;38;5;245:*rc=01;38;5;245:*1=01;38;5;245:*.nfo=01;38;5;245:*README=01;38;5;245:*README.txt=01;38;5;245:*readme.txt=01;38;5;245:*.md=01;38;5;245:*README.markdown=01;38;5;245:*.ini=01;38;5;245:*.yml=01;38;5;245:*.cfg=01;38;5;245:*.conf=01;38;5;245:*.h=01;38;5;245:*.hpp=01;38;5;245:*.c=01;38;5;245:*.cpp=01;38;5;245:*.cxx=01;38;5;245:*.cc=01;38;5;245:*.objc=01;38;5;245:*.sqlite=01;38;5;245:*.go=01;38;5;245:*.sql=01;38;5;245:*.csv=01;38;5;245:*.log=00;38;5;240:*.bak=00;38;5;240:*.aux=00;38;5;240:*.lof=00;38;5;240:*.lol=00;38;5;240:*.lot=00;38;5;240:*.out=00;38;5;240:*.toc=00;38;5;240:*.bbl=00;38;5;240:*.blg=00;38;5;240:*~=00;38;5;240:*#=00;38;5;240:*.part=00;38;5;240:*.incomplete=00;38;5;240:*.swp=00;38;5;240:*.tmp=00;38;5;240:*.temp=00;38;5;240:*.o=00;38;5;240:*.pyc=00;38;5;240:*.class=00;38;5;240:*.cache=00;38;5;240:*.aac=00;38;5;166:*.au=00;38;5;166:*.flac=00;38;5;166:*.mid=00;38;5;166:*.midi=00;38;5;166:*.mka=00;38;5;166:*.mp3=00;38;5;166:*.mpc=00;38;5;166:*.ogg=00;38;5;166:*.opus=00;38;5;166:*.ra=00;38;5;166:*.wav=00;38;5;166:*.m4a=00;38;5;166:*.axa=00;38;5;166:*.oga=00;38;5;166:*.spx=00;38;5;166:*.xspf=00;38;5;166:*.mov=01;38;5;166:*.MOV=01;38;5;166:*.mpg=01;38;5;166:*.mpeg=01;38;5;166:*.m2v=01;38;5;166:*.mkv=01;38;5;166:*.ogm=01;38;5;166:*.mp4=01;38;5;166:*.m4v=01;38;5;166:*.mp4v=01;38;5;166:*.vob=01;38;5;166:*.qt=01;38;5;166:*.nuv=01;38;5;166:*.wmv=01;38;5;166:*.asf=01;38;5;166:*.rm=01;38;5;166:*.rmvb=01;38;5;166:*.flc=01;38;5;166:*.avi=01;38;5;166:*.fli=01;38;5;166:*.flv=01;38;5;166:*.gl=01;38;5;166:*.m2ts=01;38;5;166:*.divx=01;38;5;166:*.webm=01;38;5;166:*.axv=01;38;5;166:*.anx=01;38;5;166:*.ogv=01;38;5;166:*.ogx=01;38;5;166:"
fi

# aliases
## wget with no history file
if type wget > /dev/null 2>&1; then
	alias wget="wget --no-hsts"
fi
## vim to neovim
if type nvim > /dev/null 2>&1; then
	alias vim="nvim"
fi
## other aliases
case ${OSTYPE} in
	linux*)
		export LS_COLORS
		alias ls="ls -F --color=auto"
		alias ll="ls -lh"
		alias la="ls -A"
		alias less="less -i -x2 -N -R -M"
		;;
	darwin*)
		if [ $gnu_ls ]; then
			export LS_COLORS
			alias ls="ls -F --color=auto"
			alias ll="ls -lh"
			alias la="ls -A"
			alias less="less -i -x2 -N -R -M"
			unset gnu_ls
		else
			export LSCOLORS=LS_COLORS
			alias ls="ls -F -G"
			alias ll="ls -lh"
			alias la="ls -A"
		fi
esac

# delete dulicated PATH
typeset -U PATH
