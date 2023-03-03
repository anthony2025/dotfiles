# setup our config directory dinamically
set -gx XDG_CONFIG_HOME $HOME/.config

# move ack config
set -gx ACKRC $XDG_CONFIG_HOME/ack/ackrc

# move xmonad config
set -gx XMONAD_CONFIG_DIR $XDG_CONFIG_HOME/xmonad

# enable 24 bits color
set -gx COLORTERM truecolor

# setup our editor
set -gx EDITOR nvim
set -gx VISUAL $EDITOR
set -gx GIT_EDITOR $EDITOR

# setup our file explorer
set -gx FILE vifm

# setup our internet browser
set -gx BROWSER firefox

# setup our pagers
set -gx PAGER less
set -gx MANPAGER "sh -c 'col -bx | bat -l man -p'"
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

# add coursier binaries dynamically to the path
fish_add_path -ga $HOME/.local/share/coursier/bin

if status --is-interactive && status --is-login
  # shortcuts to personal folders
  set -g dm $HOME/Documents
  set -g ds $HOME/Desktop
  set -g dw $HOME/Downloads

  # shortcuts to config files
  set -g vimrc $XDG_CONFIG_HOME/nvim
  set -g fishrc $XDG_CONFIG_HOME/fish
  set -g gitrc $XDG_CONFIG_HOME/git
  set -g tmuxrc $XDG_CONFIG_HOME/tmux
  set -g kittyrc $XDG_CONFIG_HOME/kitty
  set -g tridactylrc $XDG_CONFIG_HOME/tridactyl
  set -g xmonadrc $XDG_CONFIG_HOME/xmonad

  # better defaults
  abbr -ag :q exit
  abbr -ag l ls -h1G
  abbr -ag la ls -Ahl
  abbr -ag mv mv -v
  abbr -ag cp cp -r
  abbr -ag rm rm -rf
  abbr -ag scp scp -r
  abbr -ag mkdir mkdir -p
  abbr -ag zip zip -r
  abbr -ag sbt sbtn --color=always
  abbr -ag rsync rsync --recursive --progress --archive

  # shell utilities
  abbr -ag merge_history history --merge
  abbr -ag sync_config source $XDG_CONFIG_HOME/fish/config.fish
  abbr -ag tmux_update $XDG_CONFIG_HOME/tmux/plugins/tpm/bin/update_plugins all
end

if is_macos
    # override location of coursier binaries
    fish_add_path -ga "$HOME/Library/Application Support/Coursier/bin"

    # add firefox to path
    fish_add_path -ga /Applications/Firefox.app/Contents/MacOS

    # prepend coreutils so they take precedence over defaults
    fish_add_path -gp /usr/local/opt/coreutils/libexec/gnubin

    # prepend gnu sed for nvim-spectre
    fish_add_path -gp /usr/local/opt/gnu-sed/libexec/gnubin

    # move homebrew config
    set -gx HOMEBREW_BUNDLE_FILE $XDG_CONFIG_HOME/homebrew/Brewfile

    # silence too many redundant messages
    set -gx HOMEBREW_NO_ENV_HINTS true
end
