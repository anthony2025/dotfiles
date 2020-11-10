# Defined in /tmp/fish.GsFZMO/backup_world.fish @ line 2
function backup_world --description 'backup world and sync dumps'
  set today (date '+%m-%d-%Y')

  # we need to backup more folders to replicate
  set world_path raven:/srv/fabric/MindTheSloths
  set mods_path raven:/srv/fabric/mods
  set config_path raven:/srv/fabric/config
  set dumps_path raven:/srv/backups

  set local_dumps_path /home/anthony/backups/dumps
  set backup_path /home/anthony/backups/saves/$today
  mkdir -p $backup_path

  scp -r $world_path $backup_path
  scp -r $mods_path $backup_path
  scp -r $config_path $backup_path
  # scp -r $dumps_path/* $local_dumps_path
end
