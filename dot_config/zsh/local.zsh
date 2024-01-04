# homebrew
if type brew > /dev/null 2>&1; then
  # cache dir
  if [[ ${OSTYPE} == "darwin"* ]]; then
    export HOMEBREW_CACHE=${XDG_CACHE_HOME}/Homebrew
    export HOMEBREW_LOGS=${HOMEBREW_CACHE}/Logs
  fi
  # enable brew's completion
  fpath=($(brew --prefix)/share/zsh/site-functions $fpath)

  # use bat instead of cat
  if type bat > /dev/null 2>&1; then
    export HOMEBREW_BAT=1
  fi
fi

# editor
if type nvim > /dev/null 2>&1; then
  export EDITOR="nvim"
fi

# gnu
case ${OSTYPE} in
  darwin*)
    alias rm="rm -i"
    if [[ -d $(brew --prefix coreutils) ]]; then
      path=($(brew --prefix coreutils)/libexec/gnubin $path)
      # aliases
      alias ls="ls --classify --color=auto"
      alias ll="ls -lh"
      alias la="ls -a"
    fi
    if [[ -d $(brew --prefix grep) ]]; then
      path=($(brew --prefix grep)/libexec/gnubin $path)
      # aliases
      alias grep="grep --color=auto"
    fi
    if [[ -d $(brew --prefix findutils) ]]; then
      path=($(brew --prefix findutils)/libexec/gnubin $path)
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
## direnv
if type direnv > /dev/null 2>&1; then
  eval "$(direnv hook zsh)"
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
if [[ -d $(brew --prefix)/share/google-cloud-sdk ]]; then
  source $(brew --prefix)/share/google-cloud-sdk/path.zsh.inc
  source $(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc
fi

# Programing Languages
## Golang
if type go > /dev/null 2>&1; then
  export GOPATH=${XDG_DATA_HOME}/go
  export GOCACHE=${XDG_CACHE_HOME}/go/go-build
  export GOMODCACHE=${GOPATH}/pkg/mod
  export GOENV=${GOPATH}/env
  export PATH=${GOPATH}/bin:${PATH}
fi
## Javascript
### npm
if type npm > /dev/null 2>&1; then
  export NPM_CONFIG_USERCONFIG=${XDG_CONFIG_HOME}/npm/npmrc
  eval "$(npm completion)"
fi
## Python
### pip
if type pip > /dev/null 2>&1 || type pip3 > /dev/null 2>&1; then
  export PIP_CACHE_DIR=${XDG_CACHE_HOME}/pip
fi
### pipenv
if type pipenv > /dev/null 2>&1; then
  export PIPENV_CACHE_DIR=${XDG_CACHE_HOME}/pipenv
fi
### rye
if type rye > /dev/null 2>&1; then
  export RYE_HOME=${XDG_DATA_HOME}/rye
  export PIP_TOOLS_CACHE_DIR=${XDG_CACHE_HOME}/pip-tools
fi
## Rust
### rustup
if type cargo > /dev/null 2>&1; then
  export CARGO_HOME=${XDG_DATA_HOME}/cargo
  export PATH=${CARGO_HOME}/bin:${PATH}
fi

# for work
if [[ -e ${XDG_CONFIG_HOME}/zsh/work.sh ]]; then
  source ${XDG_CONFIG_HOME}/zsh/work.sh
fi
