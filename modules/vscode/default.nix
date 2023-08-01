{
  config,
  lib,
  pkgs,
  ...
}: {
  home.packages = [
    pkgs.alejandra
  ];

  home.file = {
    ".config/Code/User/snippets/snippets/bash.code-snippets".source = ./snippets/bash.code-snippets;
    ".config/Code/User/keybindings.json".source = ./keybindings.json;
    ".config/Code/User/locale.json".source = ./locale.json;
    ".config/Code/User/settings.json".source = ./settings.json;
  };
}
