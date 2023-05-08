function fzf --description 'triggers fzf-tmux when appropiate'
    set fzf_common_opts --cycle --reverse --ansi --color=dark
    if set -q TMUX
        fzf-tmux -p90%,80% $fzf_common_opts $argv
    else
        command fzf --height=90% $fzf_common_opts $argv
    end
end
