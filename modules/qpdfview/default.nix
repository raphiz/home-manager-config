{
  config,
  lib,
  pkgs,
  ...
}: {
  home.file = {
    ".config/qpdfview/shortcuts.conf".source = ./shortcuts.conf;
  };
}
