{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.programs.ulauncher;
in {
  options.programs.ulauncher = {
    enable = lib.mkEnableOption "Enable ulauncher";
  };

  config = lib.mkIf cfg.enable {
    home.file = {
      ".config/ulauncher/extensions.json".source = ./extensions.json;
      ".config/ulauncher/settings.json".source = ./settings.json;
      ".config/ulauncher/shortcuts.json".source = ./shortcuts.json;
      ".config/autostart/ulauncher.desktop".source = ./ulauncher.desktop;
    };
  };
}
