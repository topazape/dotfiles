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
