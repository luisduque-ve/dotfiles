{ nixpkgs, home-manager, ... }:
let
  system = "x86_64-linux";
  pkgs = nixpkgs.legacyPackages.${system};
in
{
  homeConfigurations."wsl" = home-manager.lib.homeManagerConfiguration {
    inherit pkgs;
    modules = [

      {
        home.username = "ubuntu";
        home.homeDirectory = "/home/ubuntu";
      }
      ./home.nix
    ];
  };
}
