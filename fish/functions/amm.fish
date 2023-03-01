function amm --description 'move ammonite config fles' --wraps amm
    command amm --no-home-predef --predef $XDG_CONFIG_HOME/.config/ammonite/predef.sc $argv
end
