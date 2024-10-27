{ config, pkgs, ... }:
{
  home.stateVersion = "24.05"; # Please read the comment before changing.

  home.packages = [
    pkgs.eza
    pkgs.fish
    pkgs.fzf
    pkgs.lazygit
    pkgs.neovim
    pkgs.neovim
    pkgs.nixfmt-rfc-style
    pkgs.ripgrep
    pkgs.zellij
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  programs.zsh = {
    enable = true;
    sessionVariables = {
      EDITOR = "nvim";
    };
  };
}
