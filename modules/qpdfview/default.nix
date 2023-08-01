{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.programs.qpdfview;
in {
  options.programs.qpdfview = {
    enable = lib.mkEnableOption "Enable qpdfview";
  };

  config = lib.mkIf cfg.enable {
    home.file = {
      ".config/qpdfview/shortcuts.conf".source = ./shortcuts.conf;
    };
  };
}
