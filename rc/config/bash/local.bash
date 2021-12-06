# editor
if type nvim > /dev/null 2>&1; then
	export EDITOR="nvim"
fi

# Applications
## CUDA
if type nvidia-smi > /dev/null 2>&1; then
	export __GL_SHADER_DISK_CACHE_PATH=${XDG_CACHE_HOME}/nv
	export CUDA_CACHE_PATH=${XDG_CACHE_HOME}/nv
fi
## less
if type less > /dev/null 2>&1; then
	export LESSHISTFILE=-
fi
## PostgreSQL
if type psql > /dev/null 2>&1; then
	export PSQLRC=${XDG_CONFIG_HOME}/pg/psqlrc
	export PGPASSFILE=${XDG_CONFIG_HOME}/pg/pgpass
	export PSQL_HISTORY=${XDG_CACHE_HOME}/pg/psql_history
	mkdir -p ${XDG_CACHE_HOME}/pg
fi
## usql
if type usql > /dev/null 2>&1; then
	export USQLRC=${XDG_CONFIG_HOME}/usql/usqlrc
	export USQL_HISTORY=${XDG_CACHE_HOME}/usql/usql_history
	export USQLPASS=${XDG_CACHE_HOME}/usql/usqlpass
fi
## pspg
if type pspg > /dev/null 2>&1; then
	export PSPG="--force-uniborder --bold-labels --double-header --no-last-row-search -s 22"
	export PSPG_HISTORY=${XDG_CACHE_HOME}/pspg/pspg_history
	mkdir -p ${XDG_CACHE_HOME}/pspg
fi
if type direnv > /dev/null 2>&1; then
	eval "$(direnv hook bash)"
fi
## tmux
if type tmux > /dev/null 2>&1 && [[ $OSTYPE == "linux-gnu" ]]; then
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

# Programing Languages
## Javascript
### nvm
if type brew > /dev/null 2>&1 && [[ -e $(brew --prefix nvm) ]]; then
	export NVM_DIR="$XDG_DATA_HOME"/nvm
	# This loads nvm
	[ -s "$(brew --prefix nvm)/nvm.sh" ] && . "$(brew --prefix nvm)/nvm.sh"
	# This loads nvm bash_completion
	[ -s "$(brew --prefix nvm)/etc/bash_completion.d/nvm" ] && . "$(brew --prefix nvm)/etc/bash_completion.d/nvm"
fi
### node
if type npm > /dev/null 2>&1; then
	export NPM_CONFIG_USERCONFIG=${XDG_CONFIG_HOME}/npm/npmrc
	if [[ -d ${XDG_DATA_HOME}/npm/bin ]]; then
		export PATH=${XDG_DATA_HOME}/npm/bin:${PATH}
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
## Rust
### rustup & cargo
export RUSTUP_HOME=${XDG_DATA_HOME}/rustup
export CARGO_HOME=${XDG_DATA_HOME}/cargo
if [ -e "$HOME/.local/share/cargo/env" ] ; then
	source "$HOME/.local/share/cargo/env"
fi
