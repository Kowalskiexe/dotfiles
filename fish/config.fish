if status is-interactive
    # Commands to run in interactive sessions can go here
    fish_vi_key_bindings
    alias nv "neovide --nofork"
    alias hotspot "killall lnxrouter ; sudo ip link set down wlp4s0 ; sudo lnxrouter --ap wlp4s0 Arch -p haslohaslo --ieee80211ac"
    alias ff "firefox"
    alias r "ranger"
    alias nix "nix --experimental-features 'nix-command flakes'"
    alias py10 "python3.10"
    alias gs "git status"
    alias gc "git commit"
    alias gcm "git commit -m"
    alias ga "git add"
    alias gaa "git add ."
    alias gp "git push"
    alias gpl "git pull"
    alias gf "git fetch"
end

set EDITOR nvim

ulimit -n 2048
bind --user -M insert \ch accept-autosuggestion

fish_add_path "$HOME/.local/bin"
fish_add_path "$HOME/.tmux/plugins/tmuxifier/bin"

starship init fish | source
thefuck --alias | source
eval (tmuxifier init - fish)
