# eza が無い場合は定義せず、tree コマンド本体にフォールスルーする。
if type -q eza
    alias tree="eza --classify=auto --sort=Name --tree --ignore-glob='node_modules|.git|.cache'"
end
