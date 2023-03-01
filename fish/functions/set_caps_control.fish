function set_caps_control --description 'rebinds the caps-lock key to the control key on linux'
    setxkbmap -option caps:ctrl_modifier
end
