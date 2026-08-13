# 構成と方針は README.md を参照。
# 読み込み順: conf.d/*.fish (ファイル名順) -> このファイル

if status is-interactive
    # Commands to run in interactive sessions can go here
    set fish_greeting

    # start starship
    starship init fish | source
end
