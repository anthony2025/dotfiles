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

# move homebrew bundle file
set -gx HOMEBREW_BUNDLE_FILE $XDG_CONFIG_HOME/homebrew/Brewfile

# silences too many redundant messages when installing new packages
set -gx HOMEBREW_NO_ENV_HINTS true

# add forgit binaries
fish_add_path $XDG_CONFIG_HOME/.config/fish/conf.d/bin

# add coursier binaries to the path
if is_macos
    fish_add_path "$HOME/Library/Application Support/Coursier/bin"
else
    fish_add_path $HOME/.local/share/coursier/bin
end

# JVM installed by coursier
set -gx JAVA_HOME $HOME/Library/Caches/Coursier/arc/https/github.com/AdoptOpenJDK/openjdk8-binaries/releases/download/jdk8u292-b10/OpenJDK8U-jdk_x64_mac_hotspot_8u292b10.tar.gz/jdk8u292-b10/Contents/Home

if status --is-interactive
    # personal directories
    abbr -a dm $HOME/Documents
    abbr -a ds $HOME/Desktop
    abbr -a dw $HOME/Downloads

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
end
