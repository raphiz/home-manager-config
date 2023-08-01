{
  config,
  lib,
  pkgs,
  ...
}: {
  home.packages = [
    pkgs.delta
  ];

  home.file = {
    ".gitconfig".source = ./.gitconfig;
    ".gitmessage".source = ./.gitmessage;
    ".gitignore".source = ./.gitignore;
  };
}
