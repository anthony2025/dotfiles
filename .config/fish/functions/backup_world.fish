# Defined in /tmp/fish.zsBydk/backup_world.fish @ line 2
function backup_world
  set today (date '+%m-%d-%Y')

  set world_path rufus:/srv/forge/TheSlothKingdom
  set backup_path /home/anthony/shared/saves/$today

  mkdir -p $backup_path
  scp -r $world_path $backup_path
end
