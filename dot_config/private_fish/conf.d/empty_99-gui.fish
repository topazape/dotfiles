if type -q codex
    set -gx CODEX_HOME $XDG_CONFIG_HOME/codex
    mkdir -p $CODEX_HOME
end
