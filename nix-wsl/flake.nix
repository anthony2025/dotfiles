{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs,... }@inputs: {
    nixosConfigurations."glimmer-nix" = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux"; # we are only targeting nixos
      specialArgs = {inherit inputs;};
      modules = [
        { nix.settings.experimental-features = ["nix-command" "flakes"]; } # Activate nix flakes
        ./configuration.nix
      ];
    };
  };
}
