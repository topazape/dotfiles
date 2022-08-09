# aliases
alias ls="ls --color=auto -F"
alias la="ls -A" # Compact view, show hidden
alias ll="ls -lh"

# completions
## create local completion dir
if [[ ! -d ${XDG_DATA_HOME}/zsh/site-functions ]]; then
	mkdir -p ${XDG_DATA_HOME}/zsh/site-functions
	fpath=(${XDG_DATA_HOME}/zsh/site-functions $fpath)
else
	fpath=(${XDG_DATA_HOME}/zsh/site-functions $fpath)
fi
## enable brew's completion
if type brew > /dev/null 2>&1; then
	fpath=($(brew --prefix)/share/zsh/site-functions $fpath)
fi

# editor
if type nvim > /dev/null 2>&1; then
	export EDITOR="nvim"
fi

# build
if type brew > /dev/null 2>&1 && type pkg-config > /dev/null 2>&1 && [[ -z ${PKG_CONFIG_PATH} ]]; then
	export PKG_CONFIG_PATH=$(brew --prefix)/lib/pkgconfig
fi

# Applications
## CUDA
if type nvidia-smi > /dev/null 2>&1 || type nvidia-container-cli > /dev/null 2>&1; then
	export __GL_SHADER_DISK_CACHE_PATH=${XDG_CACHE_HOME}/nv
	export CUDA_CACHE_PATH=${XDG_CACHE_HOME}/nv
fi
## less
if type less > /dev/null 2>&1; then
	export LESSHISTFILE=-
fi
## psql
if type psql > /dev/null 2>&1; then
	export PSQLRC=${XDG_CONFIG_HOME}/pg/psqlrc
	export PGPASSFILE=${XDG_CONFIG_HOME}/pg/pgpass
	export PSQL_HISTORY=${XDG_CACHE_HOME}/pg/psql_history
	mkdir -p ${XDG_CACHE_HOME}/pg
fi
## pspg
if type pspg > /dev/null 2>&1; then
	export PSPG="--force-uniborder --bold-labels --double-header --no-last-row-search -s 22"
	export PSPG_HISTORY=${XDG_CACHE_HOME}/pspg/pspg_history
	mkdir -p ${XDG_CACHE_HOME}/pspg
fi
## direnv
if type direnv > /dev/null 2>&1; then
	eval "$(direnv hook zsh)"
fi
## tmux
if type tmux > /dev/null 2>&1 && [[ ${OSTYPE} == "linux-gnu" ]]; then
	alias tmux="tmux -u"
fi
## zellij
if type zellij > /dev/null 2>&1; then
	export ZELLIJ_CONFIG_DIR=${XDG_CONFIG_HOME}/zellij
fi
## aws-cli
if type aws > /dev/null 2>&1; then
	export AWS_SHARED_CREDENTIALS_FILE=${XDG_CONFIG_HOME}/aws/credentials
	export AWS_CONFIG_FILE=${XDG_CONFIG_HOME}/aws/config
fi
## vivid
if type vivid > /dev/null 2>&1; then
	export LS_COLORS="$(vivid generate molokai)"
fi
## csvq
if type csvq > /dev/null 2>&1; then
	mkdir -p ${XDG_CACHE_HOME}/csvq
fi

# Programing Languages
## Javascript
### nvm
if type brew > /dev/null 2>&1 && [[ -e $(brew --prefix nvm) ]]; then
	export NVM_DIR=${XDG_DATA_HOME}/nvm
	# This loads nvm
	[ -s "$(brew --prefix nvm)/nvm.sh" ] && . "$(brew --prefix nvm)/nvm.sh"
	# zsh can read bash completions
	[ -s "$(brew --prefix nvm)/etc/bash_completion.d/nvm" ] && . "$(brew --prefix nvm)/etc/bash_completion.d/nvm"
fi
### npm
if type npm > /dev/null 2>&1; then
	export NPM_CONFIG_USERCONFIG=${XDG_CONFIG_HOME}/npm/npmrc
	eval "$(npm completion)"
fi
## Python
### pip
if type pip3 > /dev/null 2>&1; then
	export PIP_CACHE_DIR=${XDG_CACHE_HOME}/pip
fi
### pipenv
if type pipenv > /dev/null 2>&1; then
	export PIPENV_CACHE_DIR=${XDG_CACHE_HOME}/pipenv
fi
## Rust
if type rustup-init > /dev/null 2>&1; then
	export RUSTUP_HOME=${XDG_DATA_HOME}/rustup
	export CARGO_HOME=${XDG_DATA_HOME}/cargo
	if [[ -e "${XDG_DATA_HOME}/cargo/env" ]]; then
		source ${XDG_DATA_HOME}/cargo/env
	fi

	### completions
	if type rustup > /dev/null 2>&1; then
		rustup completions zsh > ${XDG_DATA_HOME}/zsh/site-functions/_rustup
		rustup completions zsh cargo > ${XDG_DATA_HOME}/zsh/site-functions/_cargo
	fi
fi
