# less
if type -q less
    set -gx LESSHISTFILE -
    set -gx LESS '-gj10 --no-init --quit-if-one-screen --RAW-CONTROL-CHARS'
end
