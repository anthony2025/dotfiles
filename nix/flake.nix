{
  inputs = {
    # Use `nix flake update` to update the flake to the latest revision of the chosen release channel.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    # Activate nix flakes
    nix.settings.experimental-features = ["nix-command" "flakes"];

    # Use "nixos", or your hostname as the name of the configuration
    nixosConfigurations.glimmer = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        ./modules/hardware-configuration.nix
        ./modules/configuration.nix
        #./modules/user.nix
      ];
    };
  };
}
