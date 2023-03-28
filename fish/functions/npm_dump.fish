function npm_dump --wraps='npm list -g --depth=0 > /Users/anthony/.config/npm/global_packages' --wraps='npm list -g --depth=0 > ~/.config/npm/global_packages' --description 'alias npm_dump npm list -g --depth=0 > ~/.config/npm/global_packages'
    npm list -g --depth=0 >~/.config/npm/global_packages $argv

end
