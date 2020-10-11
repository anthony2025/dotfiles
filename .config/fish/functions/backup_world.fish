# Defined in /tmp/fish.Adv4Iv/backup_world.fish @ line 2
function backup_world
  set today (date '+%m-%d-%Y')

  # we need to backup more folders to replicate
  set world_path raven:/srv/fabric/MindTheSloths
  set mods_path raven:/srv/fabric/mods
  set config_path raven:/srv/fabric/config

  set backup_path /home/anthony/case/saves/$today
  mkdir -p $backup_path

  scp -r $world_path $backup_path
  scp -r $mods_path $backup_path
  scp -r $config_path $backup_path
end
