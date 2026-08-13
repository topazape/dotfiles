# gtrash があれば rm を禁止し、ゴミ箱経由 (tm) に誘導する。
if type -q gtrash
    function rm --description 'disabled in favor of gtrash; use "tm" or "command rm"'
        echo 'rm is disabled in favor of gtrash. Use "tm" to trash, or "command rm" to really delete.' >&2
        return 1
    end
else
    alias rm="rm -i"
end
