# system environment flags
set -gx ARCHFLAGS '-arch x86_64'
set -gx LANG en_US.UTF-8
set -gx LC_ALL en_US.UTF-8
set -gx PAGER less
set -gx LESS eFRX
set -gx MANPAGER "/bin/sh -c \"col -b | nvim -c 'set ft=man ts=8 nomod nolist nonu noma' -\""
set -gx READER zathura
set -gx FILE nnn
set -gx TERMINAL kitty
set -gx BROWSER firefox-beta
set -gx VISUAL nvim
set -gx EDITOR $VISUAL
set -gx GIT_EDITOR $VISUAL

#  set custom xdg defaults
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

# set path only if necessary
set local_bin_path $HOME/.local/bin
if not contains $local_bin_path $PATH
    set fish_user_paths $fish_user_paths $local_bin_path
end

# fetch fish plugins if needed
if not functions -q fisher
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

# fetch tmux plugins if needed
if not test -d $HOME/.tmux/plugins/tpm
    git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm && $HOME/.tmux/plugins/tpm/bin/install_plugins
end

# force 24 bit support
set -gx fish_term24bit 1

# WHATSTHIS? 
fish_user_key_bindings

# set start greeting
set -gx fish_greeting Hii, (date)

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
# set -U FZF_DEFAULT_OPTS "
  # --color=bg+:#$color01,bg:#$color00,spinner:#$color0C,hl:#$color0D
  # --color=fg:#$color04,header:#$color0D,info:#$color0A,pointer:#$color0C
  # --color=marker:#$color0C,fg+:#$color06,prompt:#$color0A,hl+:#$color0D
# "

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
abbr -a storage du -ah --max-depth=1 | sort -hr
abbr -a .. cd ..
abbr -a :q exit
abbr -a ls ls -lhG --color=auto
abbr -a lsa ls -lah --color=auto
abbr -a grep grep --color=auto
abbr -a diff diff --color=auto
abbr -a mkdir mkdir -p
abbr -a mv mv -v
abbr -a rm rm -r
abbr -a cp cp -r
abbr -a scp scp -r
abbr -a xclip xclip -s clipboard

# third party programs
abbr -a resize mogrify -path . -resize 1600x1600\> -format jpg
abbr -a public_ip curl -s icanhazip.com
abbr -a npmg npm ls -g --depth=0
abbr -a ctrl_key setxkbmap -option caps:ctrl_modifier
abbr -a sort_mirrors sudo reflector --latest 100 --protocol https --sort rate --save /etc/pacman.d/mirrorlist
abbr -a dotfiles /usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME
abbr -a protonvpn sudo protonvpn connect -f

# config files
abbr -a vimrc $EDITOR $HOME/.vimrc
abbr -a tmuxrc $EDITOR $HOME/.tmux.conf
abbr -a kittyrc $EDITOR $HOME/.config/kitty/kitty.conf
abbr -a gitrc $EDITOR $HOME/.gitconfig
abbr -a xinitrc $EDITOR $HOME/.xinitrc
abbr -a i3rc $EDITOR $HOME/.config/i3/config
abbr -a fishrc $EDITOR $HOME/.config/fish/config.fish
abbr -a prompt $EDITOR $HOME/.config/fish/functions/fish_prompt.fish
abbr -a refresh source $HOME/.config/fish/config.fish
abbr -a tridactyl $EDITOR $HOME/.config/tridactyl/tridactylrc

# file shortcuts
abbr -a ds cd $HOME/Desktop
abbr -a dw cd $HOME/Downloads
abbr -a dm cd $HOME/Documents

# source ls colors
bash ~/.local/share/lscolors.sh

# automatically start X server at login
if status --is-login
    if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
        exec startx -- -keeptty
    end
end

# for aws completions run $ fisher add oh-my-fish/plugin-aws after installing aws-cli
