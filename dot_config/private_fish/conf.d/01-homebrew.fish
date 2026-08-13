# homebrew
# brew shellenv が $HOMEBREW_PREFIX を export する。以降のファイルはこれを前提に
# $HOMEBREW_PREFIX/opt/<pkg> を組み立てる (brew --prefix <pkg> と等価)。
# prefix はプラットフォームごとに異なるので、見つかった最初の1つだけを使う。
## Apple Silicon
if test -x /opt/homebrew/bin/brew
    eval (/opt/homebrew/bin/brew shellenv)
    ## Intel Mac
else if test -x /usr/local/bin/brew
    eval (/usr/local/bin/brew shellenv)
    ## Linux
else if test -x /home/linuxbrew/.linuxbrew/bin/brew
    eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
end

# 以降は $HOMEBREW_PREFIX が確定していることが条件。
# type -q brew では brew が PATH にあるだけの状態を通してしまうため使わない。
if set -q HOMEBREW_PREFIX
    # allow non-official taps
    set -gx HOMEBREW_NO_REQUIRE_TAP_TRUST 1

    # cache dir
    if test (uname) = Darwin
        set -gx HOMEBREW_CACHE $XDG_CACHE_HOME/Homebrew
        set -gx HOMEBREW_LOGS $HOMEBREW_CACHE/Logs
    end

    # use bat instead of cat
    if type -q bat
        set -gx HOMEBREW_BAT 1
    end
end
