# Defined in /tmp/fish.JgoCzV/install_yay.fish @ line 2
function install_yay --description 'bootstrap yay AUR helper'
  set previous_pwd $PWD

  echo 'creating empty yay directory'
  mkdir "$HOME/yay"

  echo 'cloning git repository' 
  git clone https://aur.archlinux.org/yay.git "$HOME/yay"

  echo 'changing into yay directory'
  cd "$HOME/yay"

  echo 'installing yay'
  makepkg -si 

  echo 'yay was installed'
  cd "$previous_pwd"
end
