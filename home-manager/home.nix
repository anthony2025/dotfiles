{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "anthony";
  home.homeDirectory = "/home/anthony";

  # activate flakes
  nix = {
    package = pkgs.nix;
    settings.experimental-features = [ "nix-command" "flakes" ];
  };

  # allow unfree programs
  nixpkgs.config.allowUnfree = true;

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "26.05"; # Please read the comment before changing.

  home.packages = with pkgs; [
    hello # # Adds the 'hello' command to your environment. It prints a friendly "Hello, world!" when run.
    python3
    python3Packages.pip
    tmux
    fzf
    fish
    tmux
    bat
    fd
    ripgrep
    xclip
    lazygit
    ack
    wget
    curl
    fish
    neovim
    ghq
    zoxide
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    git
    gcc
    gnumake
    openssh
    htop
    eza
    yazi
    ffmpeg
    jq
    fd
    poppler
    ripgrep
    resvg
    imagemagick
    file
    _7zz
    zellij
    less

    # for Scala development
    ammonite
    bloop
    coursier
    jdk
    mill
    sbt
    scala-cli
    scalafmt

    # for Zoomcamp
    terraform
    google-cloud-sdk
    pgcli
    uv

    # for assessment
    nodejs_24


    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

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
