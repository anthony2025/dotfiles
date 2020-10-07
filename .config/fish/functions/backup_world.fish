# Defined in /tmp/fish.rQXquZ/backup_world.fish @ line 2
function backup_world
  set today (date '+%m-%d-%Y')

  set world_path raven:/srv/fabric/TheSlothKingdom
  set backup_path /home/anthony/shared/.saves/$today

  mkdir -p $backup_path
  scp -r $world_path $backup_path
end
