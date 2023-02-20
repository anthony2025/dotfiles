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
  --no-init  \
  --tabs=2 \
  --wheel-lines=1

# add coursier binaries dynamically to the path
fish_add_path -ga $HOME/.local/share/coursier/bin

# setup our abbreviations, hopefully only once
if status --is-interactive && status --is-login
  source $XDG_CONFIG_HOME/fish/fish_abbreviations
end

# macos specific overrides
if test (uname) = Darwin
  # override location of coursier binaries
	fish_add_path -ga "$HOME/Library/Application Support/Coursier/bin"

  # add firefox to path
	fish_add_path -ga /Applications/Firefox.app/Contents/MacOS

  # prepend coreutils so they take precedence over defaults
	fish_add_path -gp /usr/local/opt/coreutils/libexec/gnubin

  # move homebrew config
	set -gx HOMEBREW_BUNDLE_FILE $XDG_CONFIG_HOME/homebrew/Brewfile

  # silence too many redundant messages
  set -gx HOMEBREW_NO_ENV_HINTS true
end
