# editor
if type -q nvim
    set -gx EDITOR nvim
    alias vim="nvim"
end

# starship
if type -q starship
    set -gx STARSHIP_CONFIG $XDG_CONFIG_HOME/starship/starship.toml
end

# bat
if type -q bat
    set -gx BAT_THEME TwoDark
end

# eza
if type -q eza
    alias ls="eza --classify=automatic --sort=Name"
    alias la="eza --classify=automatic --almost-all --sort=Name --git"
    alias ll="eza --classify=automatic --sort=Name --group --header --long --git"
    alias tree="eza --classify=automatic --sort=Name --tree --ignore-glob='node_modules|.git|.cache'"
end

# unzip
if test -d (brew --prefix unzip)
    fish_add_path (brew --prefix unzip)/bin
end

# gtrash
if type -q gtrash
    alias tm="gtrash put"
    function rm
        echo 'If you want to use rm really, then use "command rm" instead.'
        return 1
    end
end

# colima and docker setup
if status is-interactive
    if type -q colima and type -q docker
        # use XDG Base Directory
        set -gx COLIMA_HOME $XDG_CONFIG_HOME/colima
        set -gx DOCKER_CONFIG $XDG_CONFIG_HOME/docker
        set -gx DOCKER_HOST "unix://$COLIMA_HOME/default/docker.sock"

        # start colima if not running (background)
        fish -c 'colima status &>/dev/null; or colima start &>/dev/null' &
    end
end

# chezmoi
if type -q chezmoi
    # completion
    chezmoi completion fish | source
end

# claude
if type -q claude
    set -gx CLAUDE_CONFIG_DIR $XDG_CONFIG_HOME/claude
end
