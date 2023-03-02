function brew_dump --description 'synchronizes system state with a Brewfile'
    rm $XDG_CONFIG_HOME/homebrew/*
    brew bundle dump
    brew bundle install
end
