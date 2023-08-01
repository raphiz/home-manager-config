{
  config,
  lib,
  pkgs,
  ...
}: {
  home.file = {
    ".config/ulauncher/extensions.json".source = ./extensions.json;
    ".config/ulauncher/settings.json".source = ./settings.json;
    ".config/autostart/ulauncher.desktop".source = ./ulauncher.desktop;
  };
}
