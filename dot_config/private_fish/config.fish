if status is-interactive
    # Commands to run in interactive sessions can go here
    set fish_greeting

    # start starship
    starship init fish | source
end

# pnpm
set -gx PNPM_HOME "/Users/kawai/.local/share/pnpm"
if not string match -q -- "$PNPM_HOME/bin" $PATH
  set -gx PATH "$PNPM_HOME/bin" $PATH
end
# pnpm end
