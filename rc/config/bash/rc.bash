# XDG
export XDG_CONFIG_HOME=${HOME}/.config
export XDG_CACHE_HOME=${HOME}/.cache
export XDG_DATA_HOME=${HOME}/.local/share

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
	export PSQL_HISTORY=${XDG_CACHE_HOME}/pg/psql_history
	export PGPASSFILE=${XDG_CONFIG_HOME}/pg/pgpass
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
	export LS_COLORS="$(vivid generate one-dark)"
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
## Ruby
if [[ -e "/usr/local/opt/ruby/bin" ]]; then
	export PATH="/usr/local/opt/ruby/bin":$PATH
	### rubygem
	export GEM_HOME=${XDG_DATA_HOME}/gem
	export GEM_SPEC_CACHE=${XDG_CACHE_HOME}/gem
	if [[ -e "${GEM_HOME}/bin" ]]; then
		export PATH=${GEM_HOME}/bin:$PATH
	fi
	### bundler
	export BUNDLE_USER_CONFIG=${XDG_CONFIG_HOME}/bundle
	export BUNDLE_USER_CACHE=${XDG_CACHE_HOME}/bundle
	export BUNDLE_USER_PLUGIN=${XDG_DATA_HOME}/bundle
fi
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
