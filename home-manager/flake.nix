{
  description = "Home Manager configuration of anthony";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { self, nixpkgs, home-manager, ... }:
    let
      username = "anthony"
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      homeConfigurations.username = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          { nix.settings.experimental-features = ["nix-command" "flakes"]; } # Activate nix flakes
          ./home.nix
        ];
      };
    };
}
