# system environment flags
set -gx TERMINFO $XDG_CONFIG_HOME/terminfo
set -gx PAGER less
set -gx LESS eFRX
set -gx READER zathura
set -gx FILE vifm
set -gx TERMINAL alacritty
set -gx BROWSER firefox-beta
set -gx EDITOR nvim
set -gx VISUAL $EDITOR
set -gx GIT_EDITOR $EDITOR

# move xauthority file away from home directory
set -gx XAUTHORITY $XDG_RUNTIME_DIR/Xauthority

# set custom xdg defaults
set -gx XDG_CURRENT_DESKTOP i3-gaps
set -gx XDG_CONFIG_HOME $HOME/.config

# local folders
set -gx XDG_DESKTOP_DIR $HOME/Desktop
set -gx XDG_DOCUMENTS_DIR $HOME/Documents
set -gx XDG_DOWNLOAD_DIR $HOME/Downloads

# remote folders
set -gx XDG_MUSIC_DIR $HOME/music
set -gx XDG_PICTURES_DIR $HOME/pictures
set -gx XDG_PUBLICSHARE_DIR $HOME/shared
set -gx XDG_TEMPLATES_DIR $HOME/templates
set -gx XDG_VIDEOS_DIR $HOME/videos

# add local bin path only if necessary
set local_bin_path $HOME/.local/bin
if not contains $local_bin_path $PATH
    set fish_user_paths $fish_user_paths $local_bin_path
end

# add doom emacs bin path only if necessary
set emacs_doom_path $XDG_CONFIG_HOME/emacs/bin
if not contains $emacs_doom_path $PATH
    set fish_user_paths $fish_user_paths $emacs_doom_path
end

# force 24 bit support
set -gx fish_term24bit 1

# call a function to set our keybindings
fish_user_key_bindings

# set start greeting
set -gx fish_greeting Hii, (date --utc)

# Tomorrow Night color palette
set -gx base16_color00 1d1f21
set -gx base16_color01 282a2e
set -gx base16_color02 373b41
set -gx base16_color03 969896
set -gx base16_color04 b4b7b4
set -gx base16_color05 c5c8c6
set -gx base16_color06 e0e0e0
set -gx base16_color07 ffffff
set -gx base16_color08 cc6666
set -gx base16_color09 de935f
set -gx base16_color0A f0c674
set -gx base16_color0B b5bd68
set -gx base16_color0C 8abeb7
set -gx base16_color0D 81a2be
set -gx base16_color0E b294bb
set -gx base16_color0F a3685a

# set color aliases
set -gx base16_background $base16_color00
set -gx base16_line $base16_color01
set -gx base16_selection $base16_color02
set -gx base16_comment $base16_color03
set -gx base16_window $base16_color04
set -gx base16_foreground $base16_color05
set -gx base16_red $base16_color08
set -gx base16_orange $base16_color09
set -gx base16_yellow $base16_color0A
set -gx base16_green $base16_color0B
set -gx base16_aqua $base16_color0C
set -gx base16_blue $base16_color0D
set -gx base16_purple $base16_color0E

# set colors for fzf
set -U FZF_DEFAULT_OPTS "
  --color=bg+:#$base16_color01,bg:#$base16_color00,spinner:#$base16_color0C,hl:#$base16_color0D
  --color=fg:#$base16_color04,header:#$base16_color0D,info:#$base16_color0A,pointer:#$base16_color0C
  --color=marker:#$base16_color0C,fg+:#$base16_color06,prompt:#$base16_color0A,hl+:#$base16_color0D
"
# setup fzf
set -gx FZF_DEFAULT_OPTS '--ansi'
set -gx FZF_DEFAULT_COMMAND 'fd --type file --color=always'
set -gx FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND

# setup ack
set -gx ACKRC $XDG_CONFIG_HOME/ack/ackrc

# set terminal color palette
set -gx fish_color_autosuggestion $base16_comment
set -gx fish_color_command $base16_purple
set -gx fish_color_comment $base16_yellow
set -gx fish_color_end $base16_purple
set -gx fish_color_error $base16_red
set -gx fish_color_param $base16_blue
set -gx fish_color_quote $base16_green
set -gx fish_color_redirection $base16_aqua
set -gx fish_color_search_match $base16_yellow --background=black
set -gx fish_pager_color_completion b3a06d
set -gx fish_pager_color_description b3a06d
set -gx fish_pager_color_prefix $base16_aqua --underline
set -gx fish_pager_color_progress $base16_foreground --background=cyan

# gnu utilities
abbr -a -g .. cd ..
abbr -a -g :q exit
abbr -a -g ls ls -1 --color=auto
abbr -a -g lsa ls -lAh --color=auto
abbr -a -g grep grep --color=auto
abbr -a -g diff diff --color=auto
abbr -a -g mkdir mkdir -p
abbr -a -g mv mv -v
abbr -a -g rm rm -rf
abbr -a -g cp cp -r
abbr -a -g scp scp -r
abbr -a -g ip ip -color=auto 
abbr -a -g cclip 'xclip -f -selection primary | xclip -selection clipboard'
abbr -a -g rsync rsync -r
abbr -a -g zip zip -r

# utilities
abbr -a -g resize mogrify -path . -resize 1600x1600\> -format jpg
abbr -a -g public_ip curl -s icanhazip.com
abbr -a -g npmg npm ls -g --depth=0
abbr -a -g ctrl_key setxkbmap -option caps:ctrl_modifier
abbr -a -g sort_mirrors sudo reflector --latest 100 --protocol https --sort rate --save /etc/pacman.d/mirrorlist
abbr -a -g dotfiles git --git-dir=$HOME/.dotfiles --work-tree=$HOME
abbr -a -g usage du -ah --max-depth=1 | sort -hr
abbr -a -g protonvpn sudo protonvpn

# config files
abbr -a -g vimrc $EDITOR $XDG_CONFIG_HOME/nvim/init.vim
abbr -a -g tmuxrc $EDITOR $XDG_CONFIG_HOME/tmux/tmux.conf
abbr -a -g alacrittyrc $EDITOR $XDG_CONFIG_HOME/alacritty/alacritty.yml
abbr -a -g gitrc $EDITOR $XDG_CONFIG_HOME/git/config
abbr -a -g xinitrc $EDITOR $HOME/.xinitrc
abbr -a -g i3rc $EDITOR $XDG_CONFIG_HOME/i3/config
abbr -a -g fishrc $EDITOR $XDG_CONFIG_HOME/fish/config.fish
abbr -a -g prompt $EDITOR $XDG_CONFIG_HOME/fish/functions/fish_prompt.fish
abbr -a -g refresh source $XDG_CONFIG_HOME/fish/config.fish
abbr -a -g tridactyl $EDITOR $XDG_CONFIG_HOME/tridactyl/tridactylrc

# file shortcuts
abbr -a -g ds cd $HOME/Desktop
abbr -a -g dw cd $HOME/Downloads
abbr -a -g dm cd $HOME/Documents

if status is-login
  if test -z "$DISPLAY" -a "$XDG_VTNR" = 1 -a (hostname) = 'violet'
    # auto start X11 server
    ssh-agent startx -- -keeptty
  end
end
