# enable 24 bits color
set -gx COLORTERM truecolor

# move ack config
set -gx ACKRC $XDG_CONFIG_HOME/ack/ackrc

# move xmonad config
set -gx XMONAD_CONFIG_DIR $XDG_CONFIG_HOME/xmonad

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

# add coursier binaries to the path
fish_add_path -ga $HOME/.local/share/coursier/bin

if is_macos
    # override location of coursier binaries
    fish_add_path -ga "$HOME/Library/Application Support/Coursier/bin"

    # prepend coreutils so they take precedence over defaults
    fish_add_path -gp /usr/local/opt/coreutils/libexec/gnubin

    # prepend gnu sed for nvim-spectre
    fish_add_path -gp /usr/local/opt/gnu-sed/libexec/gnubin

    # move homebrew config
    set -gx HOMEBREW_BUNDLE_FILE $XDG_CONFIG_HOME/homebrew/Brewfile

    # silence too many redundant messages
    set -gx HOMEBREW_NO_ENV_HINTS true

    # correct firefox path
    alias firefox /Applications/Firefox.app/Contents/MacOS/
end

if status --is-interactive
    # configuration links
    abbr -a --position=anywhere vimrc $XDG_CONFIG_HOME/nvim
    abbr -a --position=anywhere fishrc $XDG_CONFIG_HOME/fish
    abbr -a --position=anywhere gitrc $XDG_CONFIG_HOME/git
    abbr -a --position=anywhere tmuxrc $XDG_CONFIG_HOME/tmux
    abbr -a --position=anywhere kittyrc $XDG_CONFIG_HOME/kitty
    abbr -a --position=anywhere tridactylrc $XDG_CONFIG_HOME/tridactyl
    abbr -a --position=anywhere xmonadrc $XDG_CONFIG_HOME/xmonad

    # folder shortcuts
    abbr -a dm $HOME/Documents
    abbr -a ds $HOME/Desktop
    abbr -a dw $HOME/Downloads

    # better defaults
    abbr -a l ls -h1G
    abbr -a la ls -Ahl
    abbr -a mv mv -v
    abbr -a cp cp -r
    abbr -a rm rm -rf
    abbr -a scp scp -r
    abbr -a mkdir mkdir -p
    abbr -a zip zip -r
    abbr -a ln ln -s
    abbr -a sbt sbtn --color=always
    abbr -a rsync rsync --recursive --progress --archive

    # replace commands
    alias vim nvim
    alias cat bat
    alias find fd
    alias grep rg

    # shell utilities
    alias :q exit
    alias stylua 'stylua --search-parent-directories'
    alias npm_dump "npm list -g --depth=0 > $XDG_CONFIG_HOME/npm/global_packages"
    alias merge_history 'history --merge'
    alias sync_config "source $XDG_CONFIG_HOME/fish/config.fish"
    alias tmux_update "$XDG_CONFIG_HOME/tmux/plugins/tpm/bin/update_plugins all"
end