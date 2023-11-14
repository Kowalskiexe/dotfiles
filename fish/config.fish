if status is-interactive
    # Commands to run in interactive sessions can go here
    fish_vi_key_bindings
    alias nv "neovide --nofork"
    alias hotspot "killall lnxrouter ; sudo ip link set down wlp4s0 ; sudo lnxrouter --ap wlp4s0 Arch -p haslohaslo --ieee80211ac"
end

fish_add_path "/home/inter/.local/bin"

starship init fish | source
