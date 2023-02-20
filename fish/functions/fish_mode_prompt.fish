function fish_mode_prompt --description 'Displays the current vi mode'
    switch $fish_bind_mode
        case default
            set_color --bold green
            echo '[N] '
        case insert
            set_color --bold blue
            echo '[I] '
        case replace_one
            set_color --dim yellow
            echo '[r] '
        case replace
            set_color --bold yellow
            echo '[R] '
        case paste
            set_color --bold magenta
            echo '[P] '
        case visual
            set_color --bold purple
            echo '[V] '
		end
    set_color normal
end
