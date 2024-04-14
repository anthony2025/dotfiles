function fish_user_key_bindings --description "setup bindings automatically on startup"
    # by default erases all previously defined bindings
    fish_vi_key_bindings --no-erase

    # quickly exit insert mode to normal mode
    bind -M insert jj "if commandline -P; commandline -f cancel; else; set fish_bind_mode default; commandline -f backward-char repaint-mode; end"
end
