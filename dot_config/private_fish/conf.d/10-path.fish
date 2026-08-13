# PATH 追加をここに集約する。
# ツール固有の変数に依存するもの ($GOPATH/bin, $CARGO_HOME/bin, $PNPM_HOME/bin) だけは
# 変数定義とセットになるため 21-env-lang.fish 側にある。
# fish_add_path -g は先頭挿入なので、後で呼んだものが PATH の前に来る。
# スコープは既定値に依存せず -g を明示する。

# user
if test -d $HOME/bin
    fish_add_path -g $HOME/bin
end

if test -d $HOME/.local/bin
    fish_add_path -g $HOME/.local/bin
end

if test -d $HOME/.local/share/npm/bin
    fish_add_path -g $HOME/.local/share/npm/bin
end

#gnu
# 未導入の警告は stderr に出す。conf.d は非対話シェルでも読まれるため、
# stdout に出すと fish -c のコマンド置換の結果を壊す。
switch (uname)
    case Darwin
        # coreutils
        if test -d "$HOMEBREW_PREFIX/opt/coreutils"
            fish_add_path -g $HOMEBREW_PREFIX/opt/coreutils/libexec/gnubin
        else
            echo "coreutils is not installed" >&2
        end
        # findutils
        if test -d "$HOMEBREW_PREFIX/opt/findutils"
            fish_add_path -g $HOMEBREW_PREFIX/opt/findutils/libexec/gnubin
        else
            echo "findutils is not installed" >&2
        end
        # gnu-sed
        if test -d "$HOMEBREW_PREFIX/opt/gnu-sed"
            fish_add_path -g $HOMEBREW_PREFIX/opt/gnu-sed/libexec/gnubin
        else
            echo "gnu-sed is not installed" >&2
        end
        # gawk
        if test -d "$HOMEBREW_PREFIX/opt/gawk"
            fish_add_path -g $HOMEBREW_PREFIX/opt/gawk/libexec/gnubin
        else
            echo "gawk is not installed" >&2
        end
        # gnu-grep
        if test -d "$HOMEBREW_PREFIX/opt/grep"
            fish_add_path -g $HOMEBREW_PREFIX/opt/grep/libexec/gnubin
        else
            echo "gnu-grep is not installed" >&2
        end
end

# unzip
if test -d "$HOMEBREW_PREFIX/opt/unzip"
    fish_add_path -g $HOMEBREW_PREFIX/opt/unzip/bin
end

# llvm (keg-only)
# 注: brew install llvm が案内する LDFLAGS/CPPFLAGS は export しない。
# 全シェルに export すると llvm の lib/include が無関係な C/C++ ビルドにも
# 漏れて壊す。必要なビルドでのみ個別に指定する:
#   LDFLAGS=-L$HOMEBREW_PREFIX/opt/llvm/lib CPPFLAGS=-I$HOMEBREW_PREFIX/opt/llvm/include
if test -d "$HOMEBREW_PREFIX/opt/llvm"
    fish_add_path -g $HOMEBREW_PREFIX/opt/llvm/bin
end
