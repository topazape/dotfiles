# fish 設定の構成

読み込み順は `conf.d/*.fish`（ファイル名順）→ `config.fish`。
`conf.d` は**非対話シェルでも必ず全部読まれる**点に注意。

## conf.d/

番号は依存順序を表す。名前は役割を表す（インストール元では分けない）。

- `00-xdg.fish` — `XDG_*`。以降のすべてが前提にする
- `01-homebrew.fish` — `brew shellenv`。`$HOMEBREW_PREFIX` を提供する
- `10-path.fish` — PATH 追加（`~/bin`, gnubin, unzip, llvm）
- `20-env-shell.fish` — シェル全体の挙動（EDITOR, LESS）
- `21-env-lang.fish` — 言語・ビルド（pkg-config, go, npm/pnpm, python, rust, typst）
- `22-env-infra.fish` — インフラ（terraform, tenv, kube, dbt, aws, docker/colima）
- `23-env-app.fish` — 単体アプリの設定（starship, bat, claude）
- `90-interactive.fish` — 対話専用（fzf キーバインド, colima 起動）

## functions/

1コマンド1ファイルの autoload。`ls` `ll` `la` `tree` `grep` `rm` `tm` `vim` と `fish_title`。

## completions/

自前の補完を置く場所（現在は空）。Homebrew 同梱の補完は
`$HOMEBREW_PREFIX/share/fish/vendor_completions.d` から fish が自動で読むので、
`<tool> completion fish | source` を書く必要はない。

## 方針

- 環境変数は `set -gx` を使う。`set -Ux` は `fish_variables` に永続化され、
  設定ファイルを消しても値が残って実態と乖離するため使わない。
- alias/function は `conf.d` に書かず `functions/` に置く。二重定義を防ぐため。
  中身は `alias` 1行でよい（fish の `alias` は function を作る。`alias --save` の
  保存先も `functions/<name>.fish`）。
- `brew --prefix <pkg>` は呼ばない（1回あたり約 25ms）。
  `$HOMEBREW_PREFIX/opt/<pkg>` を使う。ただし `$HOMEBREW_PREFIX` は
  `01-homebrew.fish` が prefix を見つけられた場合にしか設定されないので、
  依存する箇所は `set -q HOMEBREW_PREFIX` か引用符付き `test -d` で守る。
- `fish_add_path` は `-g` を明示する。既定スコープに依存しない。
- PATH 追加は `10-path.fish` に集約する。ツール固有の変数に依存するものだけ
  `21-env-lang.fish` に置く。
- 環境変数を `90-interactive.fish` に置かない。非対話シェルに引き継がれない。
- ツールの有無を判定するとき、そのツール自身が追加対象の PATH にしか無い場合は
  `type -q` ではなくディレクトリの有無で判定する（循環を避ける）。

## 落とし穴

- 空変数の展開: `test -d $VAR/opt/x` は `$VAR` 未設定だと引数0個の `test -d` に
  なり、POSIX の `test "-d"`（非空文字列判定）として**真**を返す。必ず
  `test -d "$VAR/opt/x"` と引用符で囲む。
- `fish_add_path -g` は先頭挿入なので、後から呼んだものが PATH の前に来る。
- eza は stdout が TTY でないと何も出力しない。パイプ経由の `ls` は空になる。
