{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "anthony";
  home.homeDirectory = "/home/anthony";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    pkgs.hello # # Adds the 'hello' command to your environment. It prints a friendly "Hello, world!" when run.
    pkgs.tmux
    pkgs.fzf
    pkgs.fish
    pkgs.tmux
    pkgs.bat
    pkgs.xclip
    pkgs.keepassxc
    pkgs.lazygit
    pkgs.htop
    pkgs.ack
    pkgs.wget
    pkgs.curl
    pkgs.fish
    pkgs.neovim
    pkgs.ghq
    pkgs.zoxide
    pkgs.nerd-fonts.fira-code

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  programs.bash = {
    enable = true;
    shellAliases = {
      t = "tmux";
      tls = "tmux ls";
      ta = "tmux a -t";
      tn = "tmux new -t";
    };
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
    HOME_MANAGER = "hello world";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
