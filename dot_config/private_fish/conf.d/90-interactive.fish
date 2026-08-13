# 対話シェル専用のセットアップ。キーバインドや起動処理はここに置く。
#
# 環境変数はここに置かない。非対話シェル (fish -c, スクリプト, cron) に
# 引き継がれず、原因の分かりにくい失敗になる。env は 20-23 に置く。
if status is-interactive
    # fzf (key bindings)
    # 補完は Homebrew 同梱のものが autoload されるが、キーバインドは
    # この初期化が必要。
    if type -q fzf
        fzf --fish | source
    end

    # start colima if not running (background)
    # --no-config: colima の起動確認だけが目的なので conf.d を読み直す必要がない。
    # colima は継承した PATH で見つかる。
    if type -q colima; and type -q docker
        fish --no-config -c 'colima status &>/dev/null; or colima start &>/dev/null' &
    end
end
