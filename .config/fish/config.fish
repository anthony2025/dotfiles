# system environment flags
set -gx ARCHFLAGS '-arch x86_64'
set -gx LANG en_US.UTF-8
set -gx LC_ALL en_US.UTF-8
set -gx PAGER less
set -gx LESS eFRX
set -gx READER zathura
set -gx FILE nnn
set -gx TERMINAL kitty
set -gx BROWSER firefox-beta
set -gx VISUAL nvim
set -gx EDITOR $VISUAL
set -gx GIT_EDITOR $VISUAL

#  set custom xdg defaults
set -gx XDG_CURRENT_DESKTOP i3-gaps
set -gx XDG_CONFIG_HOME "$HOME/.config"

# local folders
set -gx XDG_DESKTOP_DIR "$HOME/Desktop"
set -gx XDG_DOCUMENTS_DIR "$HOME/Documents"
set -gx XDG_DOWNLOAD_DIR "$HOME/Downloads"

# remote folders
set -gx XDG_MUSIC_DIR "$HOME/music"
set -gx XDG_PICTURES_DIR "$HOME/pictures"
set -gx XDG_PUBLICSHARE_DIR "$HOME/shared"
set -gx XDG_TEMPLATES_DIR "$HOME/templates"
set -gx XDG_VIDEOS_DIR "$HOME/videos"

# add our user binaries to path
set PATH "$HOME/.local/bin" $PATH

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
set -gx fish_greeting "Hii, "(date)

# Tomorrow Night color palette
set -gx tomorrow_window 4d5057
set -gx tomorrow_foreground c5c8c6
set -gx tomorrow_background 1d1f21
set -gx tomorrow_selection 373b41
set -gx tomorrow_line 282a2e
set -gx tomorrow_comment 969896
set -gx tomorrow_red cc6666
set -gx tomorrow_orange de935f
set -gx tomorrow_yellow f0c674
set -gx tomorrow_green b5bd68
set -gx tomorrow_aqua 8abeb7
set -gx tomorrow_blue 81a2be
set -gx tomorrow_purple b294bb

# set terminal color palette
set -gx fish_color_autosuggestion $tomorrow_comment
set -gx fish_color_command $tomorrow_purple
set -gx fish_color_comment $tomorrow_yellow
set -gx fish_color_end $tomorrow_purple
set -gx fish_color_error $tomorrow_red
set -gx fish_color_param $tomorrow_blue
set -gx fish_color_quote $tomorrow_green
set -gx fish_color_redirection $tomorrow_aqua
set -gx fish_color_search_match $tomorrow_yellow --background=black
set -gx fish_pager_color_completion b3a06d
set -gx fish_pager_color_description b3a06d
set -gx fish_pager_color_prefix $tomorrow_aqua --underline
set -gx fish_pager_color_progress $tomorrow_foreground --background=cyan

# gnu utilities
abbr -a storage du -ah --max-depth=1 | sort -hr
abbr -a .. cd ..
abbr -a :q exit
abbr -a ls ls -lhG
abbr -a lsa ls -lah
abbr -a mkdir mkdir -p
abbr -a mv mv -v
abbr -a rm rm -rf
abbr -a cp cp -r
abbr -a scp scp -r

# third party programs
abbr -a tf terraform
abbr -a resize mogrify -path . -resize 1600x1600\> -format jpg
abbr -a public_ip curl -s icanhazip.com
abbr -a npmg npm ls -g --depth=0
abbr -a ctrl_key setxkbmap -option caps:ctrl_modifier
abbr -a sort_mirrors sudo reflector --latest 100 --protocol https --sort rate --save /etc/pacman.d/mirrorlist
abbr -a dotfiles /usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME
abbr -a protonvpn sudo protonvpn connect -f

# clipboard helpers
abbr -a xclip xclip -selection clipboard
abbr -a cbf() { cat "$1" | cb; }
abbr -a cbf() { cat "$1" | cb; }
abbr -a cbssh="cbf ~/.ssh/id_rsa.pub"
abbr -a cbwd="pwd | cb"
abbr -a cbhs="cat $HISTFILE | tail -n 1 | cb"

# config files
abbr -a vimrc $EDITOR $HOME/.vimrc
abbr -a tmuxrc $EDITOR $HOME/.tmux.conf
abbr -a kittyrc $EDITOR $HOME/.config/kitty/kitty.conf
abbr -a xinitrc $EDITOR $HOME/.xinitrc
abbr -a i3rc $EDITOR $HOME/.config/i3/config
abbr -a fishrc $EDITOR $HOME/.config/fish/config.fish
abbr -a prompt $EDITOR $HOME/.config/fish/functions/fish_prompt.fish
abbr -a refresh source $HOME/.config/fish/config.fish
abbr -a tridactyl $EDITOR $HOME/.config/tridactyl/tridactylrc

# file shortcuts
abbr -a ds $HOME/Desktop
abbr -a dw $HOME/Downloads
abbr -a dm $HOME/Documents

# automatically start X server at login
if status --is-login
    if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
        exec startx -- -keeptty
    end
end

# for aws completions run $ fisher add oh-my-fish/plugin-aws after installing aws-cli
