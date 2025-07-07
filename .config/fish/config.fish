if status is-interactive
    # Commands to run in interactive sessions can go here
    fish_vi_key_bindings
    alias nv "neovide --nofork"
    alias hotspot "killall lnxrouter ; sudo ip link set down wlp4s0 ; sudo lnxrouter --ap wlp0s20f3 Arch -p haslohaslo --ieee80211ac --no-virt"
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

set -x GPG_TTY (tty)

set -x MANPAGER "less -R --use-color -Dd+r -Du+b"

set -x ANTHROPIC_API_KEY (cat ~/.config/.anthropic_api_key)
set -x GEMINI_API_KEY (cat ~/.config/.gemini_api_key)

set -x LM_STUDIO_API_KEY "dummy"
set -x LM_STUDIO_API_BASE "http://heavy:1234/v1"

#eval (tmuxifier init - fish)

fish_ssh_agent


# Productivity corner
# https://github.com/bashbunni/dotfiles/blob/19dccafbd01bd18c240d76e0f3de50876fd0c7a3/zsh/.zshrc#L78C1-L94C28

function pomodoro
    set val $argv[1]
    echo $val | dotacat
    timer "$val"m
    notify-send "'$val' session done"
end

# Aliases in fish are defined with functions
function work
    pomodoro 45
end

function br
    pomodoro 10
end
