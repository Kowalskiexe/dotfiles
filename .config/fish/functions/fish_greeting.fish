function fish_greeting
    set message (curl -s --max-time 0.5 'wttr.in/?format=3')
    if test "$message" = ""
        set message "idk"
    end
    cowsay -f "/home/inter/.config/fish/functions/cat.cow" "$message" | dotacat
end
