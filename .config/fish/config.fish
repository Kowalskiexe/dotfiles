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

    atuin init fish | source
    zoxide init fish --cmd cd | source
    starship init fish | source
end

set EDITOR nvim

ulimit -n 4096
bind --user -M insert \ch accept-autosuggestion

fish_add_path "$HOME/.local/bin"
fish_add_path "$HOME/.bin"
fish_add_path "$HOME/.tmux/plugins/tmuxifier/bin"

set -x TERM xterm-256color

eval (tmuxifier init - fish)
