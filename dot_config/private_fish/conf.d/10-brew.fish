# homebrew
## linux
if test -d /home/linuxbrew
    eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
end
## mac
if test -d /opt/homebrew
    eval (/opt/homebrew/bin/brew shellenv)
end

if type -q brew
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
