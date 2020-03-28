# system environment flags
set -gx ARCHFLAGS '-arch x86_64'
set -gx LANG en_US.UTF-8
set -gx LC_ALL en_US.UTF-8
set -gx PAGER less
set -gx LESS eFRX
set -gx READER zathura
set -gx FILE ranger
set -gx TERMINAL kitty
set -gx VISUAL vim
set -gx EDITOR $VISUAL
set -gx GIT_EDITOR $VISUAL
set -gx REACT_EDITOR $VISUAL

set -gx XDG_CONFIG_HOME "$HOME/.config"
set -gx XDG_CURRENT_DESKTOP i3-gaps

# add our user binaries to path
set PATH "$HOME/.local/bin" $PATH

# fetch plugins if needed
if not functions -q fisher
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

# force 24 bit support
set -gx fish_term24bit 1

# set user key bindings
fish_user_key_bindings

# Remove greeting
set -gx fish_greeting

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
abbr -a ... cd ../..
abbr -a ':q' exit
abbr -a ls \ls -lG 
abbr -a lsa ls -laG 
abbr -a ll ls -ahlG 
abbr -a lla ls -ahlG
abbr -a grep grep 
abbr -a mkdir mkdir -p
abbr -a mv mv -v
abbr -a rm rm -rf
abbr -a cp cp -r
abbr -a scp scp -r

# third party programs
abbr -a tf terraform
abbr -a resize mogrify -path . -resize 1600x1600\> -format jpg
abbr -a myip curl -s icanhazip.com
abbr -a cclip xclip -selection clipboard
abbr -a npmg npm ls -g --depth=0
abbr -a npmgls npm list -g --depth=0
abbr -a ctrlkey setxkbmap -option caps:ctrl_modifier
abbr -a sortmirrors sudo reflector --latest 100 --protocol https --sort rate --save /etc/pacman.d/mirrorlist
abbr -a vpn sudo protonvpn connect -f
abbr -a arch_usb sudo dd bs=4M if=arch.iso of=/dev/sdX status=progress oflag=sync
abbr -a dotfiles /usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME

# config files
abbr -a vimrc $EDITOR ~/.vimrc
abbr -a tmuxrc $EDITOR ~/.tmux.conf
abbr -a kittyrc $EDITOR ~/.config/kitty/kitty.conf
abbr -a tridactylrc $EDITOR ~/.config/tridactyl/tridactylrc
abbr -a xinitrc $EDITOR ~/.xinitrc
abbr -a i3rc $EDITOR ~/.config/i3/config
abbr -a fishrc $EDITOR ~/.config/fish/config.fish
abbr -a prompt $EDITOR ~/.config/fish/functions/fish_prompt.fish
abbr -a config $EDITOR ~/.config/fish/config.fish
abbr -a refresh source ~/.config/fish/config.fish

# shortcuts
abbr -a ds cd ~/Desktop
abbr -a dw cd ~/Downloads
abbr -a dm cd ~/Documents

# automatically start X server at login
if status --is-login
    if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
        exec startx -- -keeptty
    end
end

# for aws completions run $ fisher add oh-my-fish/plugin-aws after installing aws-cli
