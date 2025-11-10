{
  description = "anthony2025 dotfiles";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in

      # Use "nixos", or your hostname as the name of the configuration
      nixosConfigurations.glimmer = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./configuration.nix
          inputs.home-manager.nixosModules.default
        ];
      };
  };
}
