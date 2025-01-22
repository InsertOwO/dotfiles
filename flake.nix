# Note, I don't like putting the spaces on the last and first in {}'s.
{
  description = "Your new nix config";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {self, nixpkgs, ...}@inputs:
  let
    system = "x86_64-linux";
  in
  {
    # System configurations.
    nixosConfigurations = {
      # Laptop.
      nixos = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./core/laptop.nix
	  ./modu/apps-game.nix
	  inputs.home-manager.nixosModules.home-manager
        ];
      };

      # TO DO: put my desktop in this config.
    };
  };
}
