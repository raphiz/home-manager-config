{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./modules/shell.nix
    ./modules/git/default.nix

    ./modules/dotfiles-xfce/default.nix
    ./modules/vscode/default.nix
    ./modules/ulauncher/default.nix
    ./modules/qpdfview/default.nix
    ./modules/webapps/default.nix
  ];

  home.username = "raphiz";
  home.homeDirectory = "/home/raphiz";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.05"; # Please read the comment before changing.
}
