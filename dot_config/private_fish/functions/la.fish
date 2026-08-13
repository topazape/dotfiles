# la は実体のあるコマンドではないので、eza が無い場合もフォールバックが必要。
# ls -a は ls 関数 (無ければ実体の ls) に委譲する。-a は GNU/BSD 共通。
if type -q eza
    alias la="eza --classify=auto --almost-all --sort=Name --git"
else
    alias la="ls -a"
end
