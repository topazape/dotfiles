# Golang
if type -q go
    set -Ux GOPATH $XDG_DATA_HOME/go
    set -Ux GOCACHE $XDG_CACHE_HOME/go-build
    fish_add_path -gp $GOROOT/bin
    fish_add_path -ga $GOPATH/bin
end

# Javascript
## npm
if type -q npm
    set -Ux NPM_CONFIG_USERCONFIG $XDG_CONFIG_HOME/npm/npmrc
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
    set -Ux CARGO_HOME $XDG_DATA_HOME/cargo
    fish_add_path -g $CARGO_HOME/bin
end

# Typst
if type -q typst
    set -Ux TYPST_PACKAGE_PATH $XDG_DATA_HOME/typst
    set -Ux TYPST_PACKAGE_CACHE_PATH $XDG_CACHE_HOME/typst
end
