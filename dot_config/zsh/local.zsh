# editor
if type nvim > /dev/null 2>&1; then
  export EDITOR="nvim"
fi

# gnu
case ${OSTYPE} in
  darwin*)
    alias rm="rm -i"

    # coreutils
    if [[ -d $(brew --prefix coreutils) ]]; then
      path=($(brew --prefix coreutils)/libexec/gnubin $path)
      # aliases
      alias ls="ls --classify --color=auto"
      alias ll="ls -lh"
      alias la="ls -a"
    else
      echo "coreutils is not installed"
    fi
    # findutils
    if [[ -d $(brew --prefix findutils) ]]; then
      path=($(brew --prefix findutils)/libexec/gnubin $path)
    else
      echo "findutils is not installed"
    fi
    # gnu-sed
    if [[ -d $(brew --prefix gnu-sed) ]]; then
      path=($(brew --prefix gnu-sed)/libexec/gnubin $path)
    else
      echo "gnu-sed is not installed"
    fi
    # gawk
    if [[ -d $(brew --prefix gawk) ]]; then
      path=($(brew --prefix gawk)/libexec/gnubin $path)
    else
      echo "gawk is not installed"
    fi
    # gnu-grep
    if [[ -d $(brew --prefix grep) ]]; then
      path=($(brew --prefix grep)/libexec/gnubin $path)
      # aliases
      alias grep="grep --color=auto"
    else
      echo "gnu-grep is not installed"
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
## eza
if type eza > /dev/null 2>&1; then
  alias ls="eza -F --git --sort=Name"
  alias la="eza -aF --git --sort=Name"
  alias ll="eza -F --git --header --long --sort=Name"
  alias tree="eza -F --tree --ignore-glob='node_modules|.git|.cache' --sort=Name"
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
if type rustup-init > /dev/null 2>&1; then
  export RUSTUP_HOME=${XDG_DATA_HOME}/rustup
  export CARGO_HOME=${XDG_DATA_HOME}/cargo
  if [[ -e ${CARGO_HOME}/env ]]; then
    source ${CARGO_HOME}/env
  fi
  # rust completions
  if type rustup > /dev/null 2>&1; then
    rustup completions zsh > ${XDG_DATA_HOME}/zsh/zfunc/_rustup
    rustup completions zsh cargo > ${XDG_DATA_HOME}/zsh/zfunc/_cargo
  fi
fi

# for work
if [[ -e ${XDG_CONFIG_HOME}/zsh/work.sh ]]; then
  source ${XDG_CONFIG_HOME}/zsh/work.sh
fi
