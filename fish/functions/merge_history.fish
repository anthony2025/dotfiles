function merge_history --wraps='history --merge' --description 'alias merge_history history --merge'
  history --merge $argv
        
end
