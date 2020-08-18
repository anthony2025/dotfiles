# Defined in /tmp/fish.4zuyUY/battery.fish @ line 2
function battery --description 'print battery charging status'
  set -l battery /sys/class/power_supply/BAT0

  # early return if not a laptop
  if test -d battery
    exit
  end

  set capacity (cat $battery'/capacity')
  set stage (cat $battery'/status') # status is reserved

  if test "$capacity" -ge 75
    set color $tomorrow_green
  else if test "$capacity" -ge 50
    set color $tomorrow_yellow
  else if test "$capacity" -ge 25
    set color $tomorrow_orange
  else
    set color $tomorrow_red
  end

  if test "$stage" = 'Charging'
    set color $tomorrow_white
  end

  echo $stage $capacity
end
