inputs@{
  self,
  nix-darwin,
  nixpkgs,
  home-manager,
}:
let
  configuration =
    { pkgs, ... }:
    {

      users.users.squirrel = {
        name = "squirrel";
        home = "/Users/squirrel";
      };
      # Auto upgrade nix package and the daemon service.
      services.nix-daemon.enable = true;
      nix.settings.experimental-features = "nix-command flakes";

      # Create /etc/zshrc that loads the nix-darwin environment.
      programs.zsh.enable = true; # default shell on catalina
      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;
      system.stateVersion = 5;

      nixpkgs.hostPlatform = "aarch64-darwin";
    };
in
{
  darwinConfigurations."tree" = nix-darwin.lib.darwinSystem {
    modules = [
      configuration
      home-manager.darwinModules.home-manager
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.users.squirrel = import ./home.nix;
      }
    ];
  };

  darwinPackages = self.darwinConfigurations."tree".pkgs;
}
