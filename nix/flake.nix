{
  description = "Luis system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    {
      self,
      nix-darwin,
      nixpkgs,
      home-manager,
      ...
    }:
    let
      darwin = import ./darwin.nix {
        inherit
          self
          nix-darwin
          nixpkgs
          home-manager
          ;
      };
      wsl = import ./wsl.nix {
        inherit nixpkgs home-manager;
      };
    in
    {
      darwinConfigurations = darwin.darwinConfigurations;
      homeConfigurations = wsl.homeConfigurations;
    };
}
