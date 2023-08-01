{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./profiles/xfce.nix
  ];

  home.username = "raphiz";
  home.homeDirectory = "/home/raphiz";
}
