function multicd --description 'get back from deeply nested directories'
  echo cd (string repeat -n (math (string length -- $argv[1]) - 1) ../)
end
abbr -ag dotdot --regex '^\.\.+$' --function multicd

