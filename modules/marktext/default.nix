{
  config,
  lib,
  pkgs,
  ...
}: {
  home.file = {
    ".config/marktext/dataCenter.json".source = ./dataCenter.json;
    ".config/marktext/keybindings.json".source = ./keybindings.json;
    ".config/marktext/preferences.json".source = ./preferences.json;
  };
}
