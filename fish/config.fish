# setup our file editor
set -gx EDITOR nvim
set -gx VISUAL $EDITOR
set -gx GIT_EDITOR $EDITOR

# setup our file explorer
set -gx FILE vifm

# setup our internet browser
set -gx BROWSER firefox

# setup our pagers
set -gx PAGER less
set -gx MANPAGER 'nvim +Man!'
set -gx LESS \
    --quit-if-one-screen \
    --long-prompt \
    --ignore-case \
    --hilite-unread \
    --raw-control-chars \
    --use-color \
    --incsearch \
    --mouse \
    --file-size \
    --no-init \
    --tabs=2 \
    --wheel-lines=1

# enable 24 bits color
set -gx COLORTERM truecolor

# paranoid set that might be unnecessary on most systems
set -gx XDG_CONFIG_HOME $HOME/.config

# quick jumping to commonly used directories
set -gxp CDPATH . $XDG_CONFIG_HOME $HOME/Desktop

# move ack config
set -gx ACKRC $XDG_CONFIG_HOME/ack/ackrc

# move xmonad config
set -gx XMONAD_CONFIG_DIR $XDG_CONFIG_HOME/xmonad

# import session variables from nix
#bass "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"

# add coursier binaries to the path
fish_add_path $HOME/.local/share/coursier/bin

if status --is-interactive
  # personal directories
  abbr -a dm $HOME/Documents
  abbr -a ds $HOME/Desktop
  abbr -a dw $HOME/Downloads
  abbr -a config $XDG_CONFIG_HOME

  # better defaults
  abbr -a :q exit
  abbr -a lsa ls -AhGl
  abbr -a mv mv -v
  abbr -a cp cp -r
  abbr -a rm rm -rf
  abbr -a scp scp -r
  abbr -a mkdir mkdir -p
  abbr -a zip zip -r
  abbr -a ln ln -s
  abbr -a sbt sbtn --color=always
  abbr -a rsync rsync --recursive --progress --archive
  abbr -a vim nvim

  # tmux aliases
  abbr -a t tmux
  abbr -a tls tmux ls
  abbr -a ta tmux a -t
  abbr -a tn tmux new -t

  # nix aliases
  abbr -a refresh_os sudo nixos-rebuild switch --flake $XDG_CONFIG_HOME/nixos#glimmer
  abbr -a refresh_droid nix-on-droid switch --flake $XDG_CONFIG_HOME/nix-on-droid#nix-on-droid
  abbr -a refresh_wsl sudo nixos-rebuild switch --flake $XDG_CONFIG_HOME/nix-wsl#glimmer --impure
  abbr -a refresh_user home-manager switch

  # kitty manual shell integration
  if set -q KITTY_INSTALLATION_DIR
    set -gx KITTY_SHELL_INTEGRATION enabled
    source $KITTY_INSTALLATION_DIR/shell-integration/fish/vendor_conf.d/kitty-shell-integration.fish 2> /dev/null
    set --prepend fish_complete_path $KITTY_INSTALLATION_DIR/shell-integration/fish/vendor_completions.d
  end
end
