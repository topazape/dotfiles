# chezmoi
if type -q chezmoi
    # completion
    chezmoi completion fish | source
end

# gtrash (https://github.com/umlx5h/gtrash)
if type -q gtrash
    gtrash completion fish | source
    alias tm="gtrash put"
    alias rm="echo -e 'If you want to use rm really, then use \"\\\\rm\" instead.'; false"
end

# claude code
if type -q claude
end
