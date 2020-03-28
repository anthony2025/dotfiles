function bind_bang
  switch (commandline -t)
  case "!"
    commandline -t $history[1]; commandline -f repaint
  case "*"
    commandline -i !
  end
end

function fish_user_key_bindings
  # vi + emacs keybindings
  fish_hybrid_key_bindings
  fish_vi_cursor
  # sudo !!
  bind -M insert ! bind_bang
end

