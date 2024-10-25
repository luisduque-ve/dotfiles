{ config, pkgs, ... }:
{
  home.stateVersion = "24.05"; # Please read the comment before changing.

  home.packages = [
    pkgs.neovim
    pkgs.eza
    pkgs.fish
    pkgs.fzf
    pkgs.ripgrep
    pkgs.neovim
    pkgs.zellij
    pkgs.nixfmt-rfc-style
  ];

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
