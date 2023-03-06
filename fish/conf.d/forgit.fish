# setup forgit yank command across platforms
set -gx FORGIT_COPY_CMD fish_clipboard_copy

# fix output of forgit logs graph
set -gx FORGIT_LOG_FZF_OPTS --reverse

# activate forgit's git subcommands
fish_add_path -ga $HOME/.config/fish/conf.d/bin

# dont populate the namespace with a ton of aliases
#set -gx FORGIT_NO_ALIASES true
