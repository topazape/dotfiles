if status is-interactive
    # Commands to run in interactive sessions can go here
    set -g fish_prompt_pwd_dir_length 0
    starship init fish | source
end
