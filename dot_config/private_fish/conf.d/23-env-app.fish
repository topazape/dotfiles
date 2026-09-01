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

# claude
if type -q claude
    set -gx CLAUDE_CONFIG_DIR $XDG_CONFIG_HOME/claude
    set -gx CLAUDE_CODE_EFFORT_LEVEL max
end

# codex
if type -q codex
    set -gx CODEX_HOME $XDG_CONFIG_HOME/codex
    mkdir -p $CODEX_HOME
end
