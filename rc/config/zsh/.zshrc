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
export XDG_RUNTIME_DIR=/tmp/user/${UID}

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
#	export PGSERVICEFILE=${XDG_CONFIG_HOME}/pg/pg_service.conf
fi
## usql
if type usql > /dev/null 2>&1; then
	export USQLRC=${XDG_CONFIG_HOME}/usql/usqlrc
	export USQL_HISTORY=${XDG_CACHE_HOME}/usql/usql_history
	export USQLPASS=${XDG_CACHE_HOME}/usql/usqlpass
fi
## pspg
if type pspg > /dev/null 2>&1; then
	mkdir -p ${XDG_CACHE_HOME}/pspg
	export PSPG="--no-last-row-search -s 22"
	export PSPG_HISTORY=${XDG_CACHE_HOME}/pspg/pspg_history
fi
## direnv
if type direnv > /dev/null 2>&1; then
	eval "$(direnv hook zsh)"
fi
## qpdf
if type qpdf > /dev/null 2>&1; then
	eval "$(qpdf --completion-zsh)"
fi
## aws-cli
if type aws > /dev/null 2>&1; then
	export AWS_SHARED_CREDENTIALS_FILE=${XDG_CONFIG_HOME}/aws/credentials
	export AWS_CONFIG_FILE=${XDG_CONFIG_HOME}/aws/config
fi

# Programing Languages
## Javascript
### node
if type npm > /dev/null 2>&1; then
	export NPM_CONFIG_USERCONFIG=${XDG_CONFIG_HOME}/npm/npmrc
	if [[ -d ${XDG_DATA_HOME}/npm/bin ]]; then
		export PATH=${XDG_DATA_HOME}/npm/bin:${PATH}
	fi
fi
## Ruby
if [[ -e "/usr/local/opt/ruby/bin" ]]; then
	export PATH="/usr/local/opt/ruby/bin":$PATH
fi
### rubygems
export GEM_HOME=${XDG_DATA_HOME}/gem
export GEM_SPEC_CACHE=${XDG_CACHE_HOME}/gem
if [[ -e "${GEM_HOME}/bin" ]]; then
	export PATH=${GEM_HOME}/bin:$PATH
fi
### bundler
export BUNDLE_USER_CONFIG=${XDG_CONFIG_HOME}/bundle
export BUNDLE_USER_CACHE=${XDG_CACHE_HOME}/bundle
export BUNDLE_USER_PLUGIN=${XDG_DATA_HOME}/bundle
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

# ls
## LS_COLORS
if type vivid > /dev/null 2>&1; then
	LS_COLORS="$(vivid generate jellybeans)"
else
	LS_COLORS="ex=1;38;2;255;185;100:di=0;38;2;198;182;238:ln=0;38;2;250;208;122:mi=0;38;2;250;208;122;48;2;144;32;32:st=0:pi=0;38;2;240;160;192:or=0;38;2;250;208;122;48;2;144;32;32:cd=0;38;2;207;106;76:bd=0;38;2;207;106;76:*~=3;38;2;136;136;136:tw=0:ow=0:no=0:fi=0:so=0;38;2;240;160;192:*.h=0;38;2;129;151;191:*.r=0;38;2;129;151;191:*.z=4;38;2;250;208;122:*.m=0;38;2;129;151;191:*.d=0;38;2;129;151;191:*.a=1;38;2;255;185;100:*.p=0;38;2;129;151;191:*.o=3;38;2;136;136;136:*.t=0;38;2;129;151;191:*.c=0;38;2;129;151;191:*.ll=0;38;2;129;151;191:*.rb=0;38;2;129;151;191:*.xz=4;38;2;250;208;122:*.cp=0;38;2;129;151;191:*.gz=4;38;2;250;208;122:*.hh=0;38;2;129;151;191:*.di=0;38;2;129;151;191:*.jl=0;38;2;129;151;191:*.el=0;38;2;129;151;191:*.ko=1;38;2;255;185;100:*.cc=0;38;2;129;151;191:*.vb=0;38;2;129;151;191:*.hs=0;38;2;129;151;191:*.mn=0;38;2;129;151;191:*.ex=0;38;2;129;151;191:*.kt=0;38;2;129;151;191:*.ts=0;38;2;129;151;191:*.cr=0;38;2;129;151;191:*.md=0;38;2;102;135;153:*.hi=3;38;2;136;136;136:*.cs=0;38;2;129;151;191:*.bz=4;38;2;250;208;122:*.rm=0;38;2;218;208;133:*css=0;38;2;129;151;191:*.td=0;38;2;129;151;191:*.pl=0;38;2;129;151;191:*.la=3;38;2;136;136;136:*.go=0;38;2;129;151;191:*.js=0;38;2;129;151;191:*.rs=0;38;2;129;151;191:*.pm=0;38;2;129;151;191:*.py=0;38;2;129;151;191:*.gv=0;38;2;129;151;191:*.so=1;38;2;255;185;100:*.lo=3;38;2;136;136;136:*.nb=0;38;2;129;151;191:*.7z=4;38;2;250;208;122:*.ps=0;38;2;102;135;153:*.bc=3;38;2;136;136;136:*.pp=0;38;2;129;151;191:*.sh=0;38;2;129;151;191:*.ml=0;38;2;129;151;191:*.ui=0;38;2;153;173;106:*.as=0;38;2;129;151;191:*.fs=0;38;2;129;151;191:*.cgi=0;38;2;129;151;191:*.tsx=0;38;2;129;151;191:*.bib=0;38;2;153;173;106:*.iso=4;38;2;250;208;122:*.cpp=0;38;2;129;151;191:*.m4v=0;38;2;218;208;133:*.hpp=0;38;2;129;151;191:*.ics=0;38;2;102;135;153:*.aux=3;38;2;136;136;136:*.pod=0;38;2;129;151;191:*.swf=0;38;2;218;208;133:*.xls=0;38;2;102;135;153:*.xmp=0;38;2;153;173;106:*.csv=0;38;2;102;135;153:*.ltx=0;38;2;129;151;191:*.yml=0;38;2;153;173;106:*.ico=0;38;2;218;208;133:*.clj=0;38;2;129;151;191:*.sxi=0;38;2;102;135;153:*.log=3;38;2;136;136;136:*.avi=0;38;2;218;208;133:*.pro=0;38;2;118;151;214:*.ini=0;38;2;153;173;106:*.pbm=0;38;2;218;208;133:*.asa=0;38;2;129;151;191:*.wmv=0;38;2;218;208;133:*.arj=4;38;2;250;208;122:*.cfg=0;38;2;153;173;106:*.out=3;38;2;136;136;136:*.tex=0;38;2;129;151;191:*.mkv=0;38;2;218;208;133:*.fsx=0;38;2;129;151;191:*.bcf=3;38;2;136;136;136:*.fon=0;38;2;218;208;133:*.img=4;38;2;250;208;122:*.pgm=0;38;2;218;208;133:*.pas=0;38;2;129;151;191:*.mli=0;38;2;129;151;191:*.dmg=4;38;2;250;208;122:*.bat=1;38;2;255;185;100:*.bak=3;38;2;136;136;136:*.mp4=0;38;2;218;208;133:*.com=1;38;2;255;185;100:*.ps1=0;38;2;129;151;191:*.exs=0;38;2;129;151;191:*.gvy=0;38;2;129;151;191:*.png=0;38;2;218;208;133:*.txt=0;38;2;121;157;106:*.c++=0;38;2;129;151;191:*.mp3=0;38;2;218;208;133:*.idx=3;38;2;136;136;136:*TODO=0;38;2;112;185;80:*.tar=4;38;2;250;208;122:*.wav=0;38;2;218;208;133:*.sxw=0;38;2;102;135;153:*.psd=0;38;2;218;208;133:*.bin=4;38;2;250;208;122:*.svg=0;38;2;218;208;133:*.bst=0;38;2;153;173;106:*.rst=0;38;2;102;135;153:*.rar=4;38;2;250;208;122:*.htc=0;38;2;129;151;191:*.mov=0;38;2;218;208;133:*.tgz=4;38;2;250;208;122:*.apk=4;38;2;250;208;122:*.ttf=0;38;2;218;208;133:*.inl=0;38;2;129;151;191:*.tbz=4;38;2;250;208;122:*.vob=0;38;2;218;208;133:*.odp=0;38;2;102;135;153:*.tml=0;38;2;153;173;106:*.m4a=0;38;2;218;208;133:*.bsh=0;38;2;129;151;191:*.odt=0;38;2;102;135;153:*.zip=4;38;2;250;208;122:*.exe=1;38;2;255;185;100:*.elm=0;38;2;129;151;191:*.bz2=4;38;2;250;208;122:*.aif=0;38;2;218;208;133:*.xml=0;38;2;102;135;153:*.vim=0;38;2;129;151;191:*.tcl=0;38;2;129;151;191:*.sty=3;38;2;136;136;136:*.sbt=0;38;2;129;151;191:*.rpm=4;38;2;250;208;122:*.dpr=0;38;2;129;151;191:*.fnt=0;38;2;218;208;133:*.tif=0;38;2;218;208;133:*.bmp=0;38;2;218;208;133:*.csx=0;38;2;129;151;191:*.tmp=3;38;2;136;136;136:*.zsh=0;38;2;129;151;191:*.eps=0;38;2;218;208;133:*.pdf=0;38;2;102;135;153:*.otf=0;38;2;218;208;133:*.deb=4;38;2;250;208;122:*.php=0;38;2;129;151;191:*.fls=3;38;2;136;136;136:*hgrc=0;38;2;118;151;214:*.kex=0;38;2;102;135;153:*.ogg=0;38;2;218;208;133:*.awk=0;38;2;129;151;191:*.pps=0;38;2;102;135;153:*.kts=0;38;2;129;151;191:*.erl=0;38;2;129;151;191:*.dll=1;38;2;255;185;100:*.xcf=0;38;2;218;208;133:*.hxx=0;38;2;129;151;191:*.jpg=0;38;2;218;208;133:*.git=3;38;2;136;136;136:*.pid=3;38;2;136;136;136:*.epp=0;38;2;129;151;191:*.h++=0;38;2;129;151;191:*.htm=0;38;2;102;135;153:*.def=0;38;2;129;151;191:*.mir=0;38;2;129;151;191:*.ipp=0;38;2;129;151;191:*.bbl=3;38;2;136;136;136:*.inc=0;38;2;129;151;191:*.ilg=3;38;2;136;136;136:*.rtf=0;38;2;102;135;153:*.toc=3;38;2;136;136;136:*.pyc=3;38;2;136;136;136:*.nix=0;38;2;153;173;106:*.mid=0;38;2;218;208;133:*.sql=0;38;2;129;151;191:*.pkg=4;38;2;250;208;122:*.jar=4;38;2;250;208;122:*.cxx=0;38;2;129;151;191:*.blg=3;38;2;136;136;136:*.mpg=0;38;2;218;208;133:*.ppt=0;38;2;102;135;153:*.zst=4;38;2;250;208;122:*.dot=0;38;2;129;151;191:*.xlr=0;38;2;102;135;153:*.lua=0;38;2;129;151;191:*.ind=3;38;2;136;136;136:*.flv=0;38;2;218;208;133:*.fsi=0;38;2;129;151;191:*.doc=0;38;2;102;135;153:*.wma=0;38;2;218;208;133:*.ppm=0;38;2;218;208;133:*.swp=3;38;2;136;136;136:*.bag=4;38;2;250;208;122:*.ods=0;38;2;102;135;153:*.vcd=4;38;2;250;208;122:*.dox=0;38;2;118;151;214:*.gif=0;38;2;218;208;133:*.less=0;38;2;129;151;191:*.xlsx=0;38;2;102;135;153:*.make=0;38;2;118;151;214:*.psd1=0;38;2;129;151;191:*.yaml=0;38;2;153;173;106:*.tiff=0;38;2;218;208;133:*.flac=0;38;2;218;208;133:*.hgrc=0;38;2;118;151;214:*.jpeg=0;38;2;218;208;133:*.conf=0;38;2;153;173;106:*.epub=0;38;2;102;135;153:*.tbz2=4;38;2;250;208;122:*.purs=0;38;2;129;151;191:*.java=0;38;2;129;151;191:*.psm1=0;38;2;129;151;191:*.fish=0;38;2;129;151;191:*.diff=0;38;2;129;151;191:*.mpeg=0;38;2;218;208;133:*.orig=3;38;2;136;136;136:*.lisp=0;38;2;129;151;191:*.toml=0;38;2;153;173;106:*.rlib=3;38;2;136;136;136:*.bash=0;38;2;129;151;191:*.docx=0;38;2;102;135;153:*.dart=0;38;2;129;151;191:*.lock=3;38;2;136;136;136:*.pptx=0;38;2;102;135;153:*.json=0;38;2;153;173;106:*.html=0;38;2;102;135;153:*.h264=0;38;2;218;208;133:*.dyn_o=3;38;2;136;136;136:*.scala=0;38;2;129;151;191:*.patch=0;38;2;129;151;191:*.cabal=0;38;2;129;151;191:*shadow=0;38;2;153;173;106:*.mdown=0;38;2;102;135;153:*.class=3;38;2;136;136;136:*.cache=3;38;2;136;136;136:*.cmake=0;38;2;118;151;214:*.swift=0;38;2;129;151;191:*passwd=0;38;2;153;173;106:*.toast=4;38;2;250;208;122:*.shtml=0;38;2;102;135;153:*.ipynb=0;38;2;129;151;191:*README=1;38;2;101;194;84:*.xhtml=0;38;2;102;135;153:*.ignore=0;38;2;118;151;214:*COPYING=3;38;2;153;173;106:*.gradle=0;38;2;129;151;191:*.flake8=0;38;2;118;151;214:*.config=0;38;2;153;173;106:*.groovy=0;38;2;129;151;191:*INSTALL=1;38;2;101;194;84:*.dyn_hi=3;38;2;136;136;136:*.matlab=0;38;2;129;151;191:*LICENSE=3;38;2;153;173;106:*TODO.md=0;38;2;112;185;80:*TODO.txt=0;38;2;112;185;80:*Makefile=0;38;2;118;151;214:*.desktop=0;38;2;153;173;106:*.gemspec=0;38;2;118;151;214:*setup.py=0;38;2;118;151;214:*Doxyfile=0;38;2;118;151;214:*configure=0;38;2;118;151;214:*.markdown=0;38;2;102;135;153:*.fdignore=0;38;2;118;151;214:*.kdevelop=0;38;2;118;151;214:*README.md=1;38;2;101;194;84:*.rgignore=0;38;2;118;151;214:*.DS_Store=3;38;2;136;136;136:*.cmake.in=0;38;2;118;151;214:*COPYRIGHT=3;38;2;153;173;106:*.localized=3;38;2;136;136;136:*.gitconfig=0;38;2;118;151;214:*.scons_opt=3;38;2;136;136;136:*.gitignore=0;38;2;118;151;214:*README.txt=1;38;2;101;194;84:*CODEOWNERS=0;38;2;118;151;214:*SConstruct=0;38;2;118;151;214:*INSTALL.md=1;38;2;101;194;84:*SConscript=0;38;2;118;151;214:*Dockerfile=0;38;2;153;173;106:*.gitmodules=0;38;2;118;151;214:*Makefile.am=0;38;2;118;151;214:*Makefile.in=3;38;2;136;136;136:*.synctex.gz=3;38;2;136;136;136:*MANIFEST.in=0;38;2;118;151;214:*INSTALL.txt=1;38;2;101;194;84:*LICENSE-MIT=3;38;2;153;173;106:*.travis.yml=0;38;2;143;191;220:*.applescript=0;38;2;129;151;191:*.fdb_latexmk=3;38;2;136;136;136:*configure.ac=0;38;2;118;151;214:*appveyor.yml=0;38;2;143;191;220:*CONTRIBUTORS=1;38;2;101;194;84:*.clang-format=0;38;2;118;151;214:*CMakeCache.txt=3;38;2;136;136;136:*.gitattributes=0;38;2;118;151;214:*CMakeLists.txt=0;38;2;118;151;214:*LICENSE-APACHE=3;38;2;153;173;106:*CONTRIBUTORS.md=1;38;2;101;194;84:*.sconsign.dblite=3;38;2;136;136;136:*CONTRIBUTORS.txt=1;38;2;101;194;84:*requirements.txt=0;38;2;118;151;214:*package-lock.json=3;38;2;136;136;136:*.CFUserTextEncoding=3;38;2;136;136;136"
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
