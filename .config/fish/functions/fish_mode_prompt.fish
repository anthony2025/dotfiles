function fish_mode_prompt --description 'Displays the current vi mode'
    # switch $fish_bind_mode
        # case default
            # set_color --bold $base16_blue
            # echo 🅽
        # case insert
            # set_color --bold $base16_yellow
            # echo 🅸
        # case replace-one
            # set_color --bold $base16_yellow
            # echo 🆁
        # case visual
            # set_color --bold $base16_purple
            # echo 🆅
    # end
    # set_color normal
end
