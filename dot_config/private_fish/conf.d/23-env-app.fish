# 単体アプリケーションの設定 (設定ファイルの位置、テーマなど)。
#
# 置き場所の判断基準: そのアプリにしか効かない変数はここ。
#   シェル全体の挙動を変えるもの  -> 20-env-shell.fish
#   言語・ビルドツールチェーン    -> 21-env-lang.fish
#   インフラ・クラウド            -> 22-env-infra.fish
# 迷ったものを何でもここに入れると、由来でまとめていた頃の雑多なファイルに戻る。

# starship
if type -q starship
    set -gx STARSHIP_CONFIG $XDG_CONFIG_HOME/starship/starship.toml
end

# bat
if type -q bat
    set -gx BAT_THEME TwoDark
end

# llama.cpp
if type -q llama-cli
    set -gx LLAMA_CACHE $XDG_CACHE_HOME/llama.cpp
end
