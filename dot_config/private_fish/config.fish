if status is-interactive
    # Commands to run in interactive sessions can go here
    set fish_greeting
    set -U fish_prompt_pwd_dir_length 0
    starship init fish | source
end
