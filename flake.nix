{
  description = "Personal Home Manager configuration of raphiz";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-23.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    homeConfigurations."raphiz" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      modules = [
        ./profiles/graphical.nix
        {
          home.username = "raphiz";
          home.homeDirectory = "/home/raphiz";
        }
      ];
    };
  };
}
