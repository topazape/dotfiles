if status is-interactive
    # Commands to run in interactive sessions can go here
    set fish_greeting
    starship init fish | source
    set fish_prompt_pwd_dir_length 0
end
