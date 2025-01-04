# editor
if type nvim >/dev/null 2>&1; then
  export EDITOR="nvim"
  alias vim="nvim"
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
if type brew >/dev/null 2>&1 && type pkg-config >/dev/null 2>&1 && [[ -z ${PKG_CONFIG_PATH} ]]; then
  export PKG_CONFIG_PATH=$(brew --prefix)/lib/pkgconfig
fi
## unzip
if [[ -d $(brew --prefix unzip) ]]; then
  path=($(brew --prefix unzip)/bin $path)
fi

# Applications
## CUDA
if type nvidia-smi >/dev/null 2>&1 || type nvidia-container-cli >/dev/null 2>&1; then
  export __GL_SHADER_DISK_CACHE_PATH=${XDG_CACHE_HOME}/nv
  export CUDA_CACHE_PATH=${XDG_CACHE_HOME}/nv
fi
## less
if type less >/dev/null 2>&1; then
  export LESSHISTFILE=-
  export LESS='-gj10 --no-init --quit-if-one-screen --RAW-CONTROL-CHARS'
fi
## chezmoi
if type chezmoi >/dev/null 2>&1; then
  # completion
  eval "$(chezmoi completion zsh)"
fi
## bat
if type bat >/dev/null 2>&1; then
  export BAT_THEME="TwoDark"
fi
## eza
if type eza >/dev/null 2>&1; then
  # completion
  fpath=($(brew --prefix eza)/share/zsh/site-functions $fpath)

  alias ls="eza --classify=automatic --sort=Name"
  alias la="eza --classify=automatic --almost-all --sort=Name --git"
  alias ll="eza --classify=automatic --sort=Name --group --header --long --git"
  alias tree="eza --classify=automatic --sort=Name --tree --ignore-glob='node_modules|.git|.cache'"
fi

# Cloud
## aws-cli
if type aws >/dev/null 2>&1; then
  export AWS_SHARED_CREDENTIALS_FILE=${XDG_CONFIG_HOME}/aws/credentials
  export AWS_CONFIG_FILE=${XDG_CONFIG_HOME}/aws/config
fi
## google-cloud-sdk
if [[ -d $(brew --prefix)/share/google-cloud-sdk ]]; then
  source $(brew --prefix)/share/google-cloud-sdk/path.zsh.inc
  source $(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc
fi
## tenv
if [[ -d $(brew --prefix tenv) ]]; then
  export TENV_ROOT=${XDG_DATA_HOME}/tenv
fi

# Programing Languages
## LLVM
if [[ -d $(brew --prefix llvm) ]]; then
  export PATH="$(brew --prefix llvm)/bin:${PATH}"
  export LDFLAGS="-L$(brew --prefix llvm)/lib"
  export CPPFLAGS="-I$(brew --prefix llvm)/include"
fi
## Golang
if type go >/dev/null 2>&1; then
  export GOPATH=${XDG_DATA_HOME}/go
  export GOCACHE=${XDG_CACHE_HOME}/go/go-build
  export GOMODCACHE=${GOPATH}/pkg/mod
  export GOENV=${GOPATH}/env
  export PATH=${GOPATH}/bin:${PATH}
fi
## Javascript
### npm
if type npm >/dev/null 2>&1; then
  export NPM_CONFIG_USERCONFIG=${XDG_CONFIG_HOME}/npm/npmrc
  eval "$(npm completion)"
fi
## Python
if type python3 >/dev/null 2>&1; then
  export IPYTHONDIR=${XDG_CONFIG_HOME}/ipython
  export JUPYTER_CONFIG_DIR=${XDG_CONFIG_HOME}/jupyter
  export MPLCONFIGDIR=${XDG_CONFIG_HOME}/matplotlib
  export SEABORN_DATA=${XDG_DATA_HOME}/seaborn
  export PYTENSOR_FLAGS="base_compiledir=${XDG_CACHE_HOME}/pytensor"
fi
### pip
if type pip >/dev/null 2>&1 || type pip3 >/dev/null 2>&1; then
  export PIP_CACHE_DIR=${XDG_CACHE_HOME}/pip
fi
### R language
if type R >/dev/null 2>&1; then
  export RENV_PATHS_ROOT=${XDG_CACHE_HOME}/R/renv
fi
## Rust
### cargo
if type cargo >/dev/null 2>&1; then
  export CARGO_HOME=${XDG_DATA_HOME}/cargo
  export PATH=${CARGO_HOME}/bin:${PATH}
fi
## Typst
if type typst >/dev/null 2>&1; then
  export TYPST_PACKAGE_PATH=${XDG_DATA_HOME}/typst
  export TYPST_PACKAGE_CACHE_PATH=${XDG_CACHE_HOME}/typst
fi

# for work
if [[ -e ${XDG_CONFIG_HOME}/zsh/work.sh ]]; then
  source ${XDG_CONFIG_HOME}/zsh/work.sh
fi
