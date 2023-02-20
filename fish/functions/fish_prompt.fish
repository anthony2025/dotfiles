function _print_in_color
  set_color $argv[2]
  printf $argv[1]
  set_color normal
end

function _prompt_color_for_status
  if test $argv[1] -eq 0
    echo green
  else
    echo red
  end
end

function fish_prompt
  set -l last_status $status

  _print_in_color '[' red
  _print_in_color $USER yellow
  _print_in_color @ (_prompt_color_for_status $last_status)
  _print_in_color (prompt_hostname) blue
  _print_in_color ' '(prompt_pwd --full-length-dirs=3 --dir-length=4) purple
  _print_in_color '] ' red
  _print_in_color (date +%H:%M.%S) yellow

  __fish_git_prompt " %s"

  _print_in_color "\n❯ " blue
end
