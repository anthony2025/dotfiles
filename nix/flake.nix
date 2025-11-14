{
  inputs = {
    # Use `nix flake update` to update the flake to the latest revision of the chosen release channel.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    # Use "nixos", or your hostname as the name of the configuration
    nixosConfigurations.glimmer = nixpkgs.lib.nixosSystem {
      # we are only targeting nixos
      system = "x86_64-linux";
      specialArgs = {inherit inputs;};
      modules = [
        ./hardware-configuration.nix
        ./configuration.nix
      ];
    };
  };
}
