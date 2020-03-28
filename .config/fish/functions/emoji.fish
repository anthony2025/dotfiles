function emoji
    set chosen (cut -d ';' -f1 ~/.local/share/emoji | dmenu -i -l 20 | sed "s/ .*//")

    if test -z "$chosen"
      exit 1
    end

    echo $chosen | tr -d '\n' | xclip -selection clipboard
    notify-send $chosen' copied to clipboard.' &
end

