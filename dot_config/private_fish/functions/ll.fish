# ll は実体のあるコマンドではないので、eza が無い場合もフォールバックが必要。
# ls -lh は ls 関数 (無ければ実体の ls) に委譲する。-l/-h は GNU/BSD 共通。
if type -q eza
    alias ll="eza --classify=auto --sort=Name --group --header --long --git"
else
    alias ll="ls -lh"
end
