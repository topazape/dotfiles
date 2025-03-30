if status is-interactive
    # Commands to run in interactive sessions can go here
    set fish_greeting
    starship init fish | source
    set -U fish_completion_description_max_width 1000
end
