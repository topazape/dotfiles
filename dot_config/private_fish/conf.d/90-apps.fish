# chezmoi
if type -q chezmoi
    # completion
    chezmoi completion fish | source
end

# gtrash (https://github.com/umlx5h/gtrash)
if type -q gtrash
    gtrash completion fish | source
    alias tm="gtrash put"
    function rm
        echo 'If you want to use rm really, then use "\rm" instead.'
        return 1
    end
end

# claude code
if type -q claude
    set -gx CLAUDE_CONFIG_DIR $XDG_CONFIG_HOME/claude
end
