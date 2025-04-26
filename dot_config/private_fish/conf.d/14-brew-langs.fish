# Golang
## goenv
if type -q goenv
    set -gx GOENV_ROOT $XDG_DATA_HOME/goenv
    fish_add_path -p $GOENV_ROOT/shims $GOENV_ROOT/bin
    status --is-interactive; and source (goenv init -|psub)
end
## golang
if type -q go
    set -gx GOPATH $XDG_DATA_HOME/go
    set -gx GOCACHE $XDG_CACHE_HOME/go-build
    set -gx GOMODCACHE $GOPATH/pkg/mod
    set -gx GOENV $GOPATH/env
    fish_add_path -p $GOROOT/bin
    fish_add_path -a $GOPATH/bin
end

# Javascript
## npm
if type -q npm
    set -gx NPM_CONFIG_USERCONFIG $XDG_CONFIG_HOME/npm/npmrc
    # Fish has npm completions built-in
end

# Python
if type -q python3
    set -gx IPYTHONDIR $XDG_CONFIG_HOME/ipython
    set -gx JUPYTER_CONFIG_DIR $XDG_CONFIG_HOME/jupyter
    set -gx MPLCONFIGDIR $XDG_CONFIG_HOME/matplotlib
    set -gx SEABORN_DATA $XDG_DATA_HOME/seaborn
    set -gx PYTENSOR_FLAGS "base_compiledir=$XDG_CACHE_HOME/pytensor"
end
## pip
if type -q pip; or type -q pip3
    set -gx PIP_CACHE_DIR $XDG_CACHE_HOME/pip
end

# Rust
## cargo
if type -q cargo
    set -gx CARGO_HOME $XDG_DATA_HOME/cargo
    fish_add_path $CARGO_HOME/bin
end

# Typst
if type -q typst
    set -gx TYPST_PACKAGE_PATH $XDG_DATA_HOME/typst
    set -gx TYPST_PACKAGE_CACHE_PATH $XDG_CACHE_HOME/typst
end
