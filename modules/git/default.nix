{
  config,
  lib,
  pkgs,
  ...
}: {
  home.file = {
    ".gitconfig".source = ./.gitconfig;
    ".gitmessage".source = ./.gitmessage;
    ".gitignore".source = ./.gitignore;
  };
}
