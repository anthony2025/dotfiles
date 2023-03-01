function amm --description 'move ammonite config fles'
    command amm --no-home-predef --predef $XDG_CONFIG_HOME/.config/ammonite/predef.sc $argv
end
