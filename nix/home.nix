{ pkgs, ... }:
{
  home-manager.users.squirrel = {
    # Fixed incorrect attribute path
    home.stateVersion = "24.05"; # This is correct for Home Manager versioning

    # Declares packages to be installed in the user's environment
    home.packages = [
      pkgs.vim
    ];

    # Configure session variables like the default editor
    home.sessionVariables = {
      EDITOR = "nvim";
    };

    home.file = { };
  };
}
