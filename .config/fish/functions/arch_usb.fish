# Defined in /tmp/fish.UYIfCq/arch_usb.fish @ line 2
function arch_usb --description 'create installation media from iso' --argument iso device
  sudo dd bs=4M if=$iso of=$device status=progress oflag=sync
end
