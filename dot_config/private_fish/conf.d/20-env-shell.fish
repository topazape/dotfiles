# シェル共通の環境変数

# editor
if type -q nvim
    set -gx EDITOR nvim
end

# less
if type -q less
    set -gx LESSHISTFILE -
    set -gx LESS '-gj10 --no-init --quit-if-one-screen --RAW-CONTROL-CHARS'
end
