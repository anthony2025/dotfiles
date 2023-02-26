function fish_user_key_bindings --description "setup bindings automatically on startup"
  # sets emacs-like keybindings first so vim ones win
	fish_hybrid_key_bindings

  # fzf mappings for normal mode
	bind -M default \ct fzf_file_widget
  bind -M default \cr fzf_history_widget
  bind -M default \cp fzf_cd_widget

  # fzf mappings for insert mode
  bind -M insert \ct fzf_file_widget
  bind -M insert \cr fzf_history_widget
  bind -M insert \cp fzf_cd_widget

  # quickly change to insert mode from visual mode
  bind -M visual -m insert i

  # quickly exit insert mode to normal mode
  bind -M insert jj "if commandline -P; commandline -f cancel; else; set fish_bind_mode default; commandline -f backward-char repaint-mode; end"
end
