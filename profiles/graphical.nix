{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./headless.nix

    ../modules/dotfiles-xfce/default.nix
    ../modules/vscode/default.nix
    ../modules/ulauncher/default.nix
    ../modules/qpdfview/default.nix
    ../modules/webapps/default.nix
  ];
}
