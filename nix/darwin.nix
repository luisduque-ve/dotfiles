{
  self,
  nix-darwin,
  home-manager,
  ...
}:
let
  configuration =
    { pkgs, ... }:
    {
      environment.systemPackages = import ./common-cli.nix { inherit pkgs; };

      environment.variables = {
        EDITOR = "${pkgs.neovim}/bin/nvim";
        VISUAL = "${pkgs.neovim}/bin/nvim";
      };

      users.users.squirrel = {
        name = "squirrel";
        home = "/Users/squirrel";
      };
      # Auto upgrade nix package and the daemon service.
      services.nix-daemon.enable = true;

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = [ "nix-command flakes" ];

      # Create /etc/zshrc that loads the nix-darwin environment.
      programs.zsh.enable = true;
      programs.fish.enable = true;

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 5;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";
    };
in
{
  # Build darwin flake using:
  # $ darwin-rebuild build --flake .#simple
  darwinConfigurations."tree" = nix-darwin.lib.darwinSystem {
    modules = [
      configuration
      {
        imports = [
          ./home.nix
          home-manager.darwinModules.home-manager
        ];
      }
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
      }
    ];
  };

  # Expose the package set, including overlays, for convenience.
  darwinPackages = self.darwinConfigurations."tree".pkgs;
}
