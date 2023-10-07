# enable brew's completion
if type brew > /dev/null 2>&1; then
  fpath=($(brew --prefix)/share/zsh/site-functions $fpath)
fi

# editor
if type nvim > /dev/null 2>&1; then
  export EDITOR="nvim"
fi

# gnu
case ${OSTYPE} in
  darwin*)
    alias rm="rm -i"
    if [[ -d $(brew --prefix)/opt/coreutils/libexec/gnubin ]]; then
      path=($(brew --prefix)/opt/coreutils/libexec/gnubin $path)
      # aliases
      alias ls="ls --classify --color=auto"
      alias ll="ls -lh"
      alias la="ls -a"
    fi
    if [[ -d $(brew --prefix)/opt/grep/libexec/gnubin ]]; then
      path=($(brew --prefix)/opt/grep/libexec/gnubin $path)
      # aliases
      alias grep="grep --color=auto"
    fi
    if [[ -d $(brew --prefix)/opt/findutils/libexec/gnubin ]]; then
      path=($(brew --prefix)/opt/findutils/libexec/gnubin $path)
    fi
    ;;
  linux*)
    # aliases
    alias ls="ls --classify --color=auto"
    alias ll="ls -lh"
    alias la="ls -a"
    alias grep="grep --color=auto"
    alias rm="rm -i"
    ;;
esac

# build
## pkg-config
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
  export LESS='-gj10 --no-init --quit-if-one-screen --RAW-CONTROL-CHARS'
fi
## psql
if type psql > /dev/null 2>&1; then
  export PSQLRC=${XDG_CONFIG_HOME}/pg/psqlrc
  export PGPASSFILE=${XDG_CONFIG_HOME}/pg/pgpass
  export PSQL_HISTORY=${XDG_CACHE_HOME}/pg/psql_history
  mkdir -p ${XDG_CACHE_HOME}/pg
fi
## direnv
if type direnv > /dev/null 2>&1; then
  eval "$(direnv hook zsh)"
fi
## zellij
if type zellij > /dev/null 2>&1; then
  export ZELLIJ_CONFIG_DIR=${XDG_CONFIG_HOME}/zellij
fi
## bat
if type bat > /dev/null 2>&1; then
  export BAT_THEME="TwoDark"
fi
## vivid
if type vivid > /dev/null 2>&1; then
  # export LS_COLORS="$(vivid generate alabaster_dark)"
  # export LS_COLORS="$(vivid generate ayu)"
  # export LS_COLORS="$(vivid generate catppuccin-frappe)"
  # export LS_COLORS="$(vivid generate catppuccin-latte)"
  # export LS_COLORS="$(vivid generate catppuccin-macchiato)"
  export LS_COLORS="$(vivid generate catppuccin-mocha)"
  # export LS_COLORS="$(vivid generate dracula)"
  # export LS_COLORS="$(vivid generate gruvbox-dark)"
  # export LS_COLORS="$(vivid generate gruvbox-dark-hard)"
  # export LS_COLORS="$(vivid generate gruvbox-dark-soft)"
  # export LS_COLORS="$(vivid generate gruvbox-light)"
  # export LS_COLORS="$(vivid generate gruvbox-light-hard)"
  # export LS_COLORS="$(vivid generate gruvbox-light-soft)"
  # export LS_COLORS="$(vivid generate iceberg-dark)"
  # export LS_COLORS="$(vivid generate jellybeans)"
  # export LS_COLORS="$(vivid generate lava)"
  # export LS_COLORS="$(vivid generate modus-operandi)"
  # export LS_COLORS="$(vivid generate molokai)"
  # export LS_COLORS="$(vivid generate nord)"
  # export LS_COLORS="$(vivid generate one-dark)"
  # export LS_COLORS="$(vivid generate one-light)"
  # export LS_COLORS="$(vivid generate snazzy)"
  # export LS_COLORS="$(vivid generate solarized-dark)"
  # export LS_COLORS="$(vivid generate solarized-light)"
fi

# Cloud
## aws-cli
if type aws > /dev/null 2>&1; then
  export AWS_SHARED_CREDENTIALS_FILE=${XDG_CONFIG_HOME}/aws/credentials
  export AWS_CONFIG_FILE=${XDG_CONFIG_HOME}/aws/config
fi
## google-cloud-sdk
if [[ -e $(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc ]]; then
  source $(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc
fi

# Programing Languages
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
### rye
if type rye > /dev/null 2>&1; then
  export RYE_HOME=${XDG_DATA_HOME}/rye
fi
### cookiecutter
if type cookiecutter > /dev/null 2>&1; then
  export COOKIECUTTER_CONFIG=${XDG_CONFIG_HOME}/cookiecutter/config.yaml
fi
## Rust
### rustup
if type rustup-init > /dev/null 2>&1; then
  export RUSTUP_HOME=${XDG_DATA_HOME}/rustup
  export CARGO_HOME=${XDG_DATA_HOME}/cargo
  source ${CARGO_HOME}/env
fi
## Go
if type go > /dev/null 2>&1; then
  export GOPATH=${XDG_DATA_HOME}/go
  export GOCACHE=${XDG_CACHE_HOME}/go/go-build
  export GOMODCACHE=${XDG_CACHE_HOME}/go/pkg/mod

  export PATH=${GOPATH}/bin:${PATH}
fi
## Java
if [[ -d $(brew --prefix)/opt/openjdk ]]; then
  export JAVA_HOME="$(brew --prefix)/opt/openjdk"
  export PATH=${JAVA_HOME}/bin:${PATH}
  export CPPFLAGS="${CPPFLAGS} -I/opt/homebrew/opt/openjdk/include"
  export JDK_TOOL_OPTIONS="-Duser.language=en"
fi
### maven
if type mvn > /dev/null 2>&1; then
  export MAVEN_OPTS="-Dmaven.repo.local=${XDG_DATA_HOME}/m2/repository"
fi
## R
if type R > /dev/null 2>&1; then
  mkdir -p ${XDG_CACHE_HOME}/R
  export R_HISTFILE=${XDG_CACHE_HOME}/R/Rhistory
fi

# for work
if [[ -e ${XDG_CONFIG_HOME}/zsh/work.sh ]]; then
  source ${XDG_CONFIG_HOME}/zsh/work.sh
fi
