# kitty manual shell integration
if status --is-interactive && set -q KITTY_INSTALLATION_DIR
	set -gx KITTY_SHELL_INTEGRATION enabled
	source $KITTY_INSTALLATION_DIR/shell-integration/fish/vendor_conf.d/kitty-shell-integration.fish
	set -pg fish_complete_path $KITTY_INSTALLATION_DIR/shell-integration/fish/vendor_completions.d
end

