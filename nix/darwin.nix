{
  self,
  nix-darwin,
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

      # Auto upgrade nix package and the daemon service.
      services.nix-daemon.enable = true;
      # nix.package = pkgs.nix;

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = [ "nix-command flakes" ];

      # Create /etc/zshrc that loads the nix-darwin environment.
      programs.zsh.enable = true; # default shell on catalina
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
    modules = [ configuration ];
  };

  # Expose the package set, including overlays, for convenience.
  darwinPackages = self.darwinConfigurations."tree".pkgs;
}
