# XDG
if not test -d $HOME/.config
  mkdir -p "$HOME/.config"
end

if not test -d $HOME/.cache
  mkdir -p "$HOME/.cache"
end

if not test -d $HOME/.local/share
  mkdir -p "$HOME/.local/share"
end

set -gx XDG_CONFIG_HOME $HOME/.config
set -gx XDG_CACHE_HOME $HOME/.cache
set -gx XDG_DATA_HOME $HOME/.local/share
set -gx XDG_STATE_HOME $HOME/.local/state
