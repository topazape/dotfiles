if status is-interactive
    # Commands to run in interactive sessions can go here
    set fish_greeting
    starship init fish | source
end

# Limit fish-lsp indexing to user config only (skip $__fish_data_dir for faster startup)
set -gx fish_lsp_all_indexed_paths "$__fish_config_dir"
