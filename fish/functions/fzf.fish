function fzf --description 'triggers fzf-tmux when appropiate'
    if test -n "$TMUX"
        alias fzf fzf-tmux
        fzf-tmux -p90%,80% --cycle --reverse --ansi --color=dark $argv
    else
        command fzf --height=90% --cycle --reverse --ansi --color=dark $argv
    end
end
