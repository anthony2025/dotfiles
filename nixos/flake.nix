{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    # Use "nixos", or your hostname as the name of the configuration
    nixosConfigurations.glimmer = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux"; # we are only targeting nixos
      specialArgs = {inherit inputs;};
      modules = [
        { nix.settings.experimental-features = ["nix-command" "flakes"]; } # Activate nix flakes
        ./hardware-configuration.nix
        ./configuration.nix
      ];
    };
  };
}
