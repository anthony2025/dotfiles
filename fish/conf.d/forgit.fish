if status --is-interactive
    # setup forgit yank command across platforms
    set -gx FORGIT_COPY_CMD fish_clipboard_copy

    # fix output of forgit logs graph
    set -gx FORGIT_LOG_FZF_OPTS --reverse

    # activate completion for the git subcommands
    set origin = $HOME/.config/fish/completions
    set target = $HOME/.local/share/bash-completion/completions
    if test -e "$target/git-forgit.bash"
        mkdir -p $target
        ln -s $origin/git-forgit.bash $target/forgit.bash
    end
end
