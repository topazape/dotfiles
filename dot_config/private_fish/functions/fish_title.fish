function fish_title
    # show ssh hostname if connected
    set -l ssh ""
    # check if we are in an SSH session
    if set -q SSH_TTY
        set ssh "["(prompt_hostname | string sub -l 10 | string collect)"] "
    end

    # show current command if any
    if set -q argv[1]
        set -l cmd (string split ' ' $argv[1])[1]
        echo -- $ssh$cmd
    else
        set -l cmd (status current-command)
        # replace "fish" with custom prompt indicator
        if string match -q fish $cmd
            set cmd " "
        end
        echo -- $ssh$cmd
    end
end
