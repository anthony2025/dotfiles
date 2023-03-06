# link global editorconfig file to the top most directory
if test ! -e $HOME/.editorconfig
  ln -s $HOME/.config/editorconfig/config ~/.editorconfig
end