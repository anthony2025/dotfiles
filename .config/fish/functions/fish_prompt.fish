set fish_prompt_pwd_dir_length 0

# Git prompt
set __fish_git_prompt_showdirtystate yes
set __fish_git_prompt_showupstream yes
set __fish_git_prompt_color_branch $base16_line
set __fish_git_prompt_color_dirtystate $base16_yellow
set __fish_git_prompt_color_stagedstate $base16_green
set __fish_git_prompt_color_upstream $base16_aqua

# Git Characters
set __fish_git_prompt_char_dirtystate '*'
set __fish_git_prompt_char_stagedstate '⇢'
set __fish_git_prompt_char_upstream_prefix ' '
set __fish_git_prompt_char_upstream_equal ''
set __fish_git_prompt_char_upstream_ahead '⇡'
set __fish_git_prompt_char_upstream_behind '⇣'
set __fish_git_prompt_char_upstream_diverged '⇡⇣'

function _print_in_color
  set -l string $argv[1]
  set -l color  $argv[2]

  set_color $color
  printf $string
  set_color normal
end

function _prompt_color_for_status
  if test $argv[1] -eq 0
    echo $base16_green
  else
    echo $base16_red
  end
end

function fish_prompt
  set -l last_status $status

  _print_in_color '[ ' $base16_red
  _print_in_color $USER $base16_yellow
  _print_in_color @ (_prompt_color_for_status $last_status)
  _print_in_color (prompt_hostname) $base16_blue
  _print_in_color ' '(prompt_pwd) $base16_purple
  _print_in_color ' ] ' $base16_red
  _print_in_color (battery)%% $base16_orange

  __fish_git_prompt " %s"

  switch $fish_bind_mode
      case default
          _print_in_color "\n❯ " $base16_blue
      case insert
          _print_in_color "\n❯ " $base16_green
      case replace-one
          _print_in_color "\n❯ " $base16_orange
      case visual
          _print_in_color "\n❯ " $base16_purple
  end
end

