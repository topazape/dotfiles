# eza があれば eza を使う。無ければ定義せず、fish 組み込みの ls 関数に
# フォールスルーする。組み込み側が GNU/BSD の色オプションを判別してくれるので、
# ここで --color=auto 等を手書きするより確実。
if type -q eza
    alias ls="eza --classify=auto --sort=Name"
end
