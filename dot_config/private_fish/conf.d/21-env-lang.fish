# 言語・ビルドツールチェーンの環境変数
# PATH 追加は原則 10-path.fish にある。ここに残っているのは、ツール固有の変数
# ($GOPATH, $CARGO_HOME, $PNPM_HOME) に依存して変数定義とセットになるものだけ。

# C/C++
## pkg-config
# ガードは set -q HOMEBREW_PREFIX。type -q brew だと、brew が PATH にあるのに
# shellenv が通っていない状態 (prefix 未確定) で空値を export してしまう。
if set -q HOMEBREW_PREFIX; and type -q pkg-config; and test -z "$PKG_CONFIG_PATH"
    set -gx PKG_CONFIG_PATH $HOMEBREW_PREFIX/lib/pkgconfig
end

# Golang
if type -q go
    set -gx GOPATH $XDG_DATA_HOME/go
    set -gx GOCACHE $XDG_CACHE_HOME/go-build
    fish_add_path -ga $GOPATH/bin
end

# Javascript
## npm
if type -q npm
    set -gx NPM_CONFIG_USERCONFIG $XDG_CONFIG_HOME/npm/npmrc
    # Fish has npm completions built-in
end

## pnpm
# ディレクトリの有無で判定する。type -q pnpm だと、pnpm が $PNPM_HOME/bin に
# しか無い場合に「PATH に無いから追加もされない」という循環になる。
# fish_user_paths ではなく PATH を直接前置しているのは pnpm 自身の想定に合わせ、
# グローバルインストールしたコマンドを最優先にするため。
if test -d $XDG_DATA_HOME/pnpm/bin
    set -gx PNPM_HOME $XDG_DATA_HOME/pnpm
    if not contains $PNPM_HOME/bin $PATH
        set -gx PATH $PNPM_HOME/bin $PATH
    end
end

# Python
if type -q python3
    set -gx PTPYTHON_CONFIG_HOME $XDG_CONFIG_HOME/ptpython
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
# CARGO_HOME は cargo の有無に関わらず宣言する (rustup がこれを見てインストール先を
# 決めるため)。PATH 追加はディレクトリの有無で判定する。pnpm と同じ循環を避ける。
set -gx CARGO_HOME $XDG_DATA_HOME/cargo
if test -d $CARGO_HOME/bin
    fish_add_path -g $CARGO_HOME/bin
end

# Typst
if type -q typst
    set -gx TYPST_PACKAGE_PATH $XDG_DATA_HOME/typst
    set -gx TYPST_PACKAGE_CACHE_PATH $XDG_CACHE_HOME/typst
end
