{
  config,
  lib,
  pkgs,
  ...
}: {
  home.file = let
    applications = builtins.attrNames (builtins.readDir ./webapps);
    desktop-files = builtins.listToAttrs (
      map (name: {
        name = ".local/share/applications/${name}.desktop";
        value = {source = ./webapps/${name}/${name}.desktop;};
      })
      applications
    );
    icons = builtins.listToAttrs (
      map (name: {
        name = ".local/share/icons/hicolor/128x128/apps/${name}.png";
        value = {source = ./webapps/${name}/${name}.png;};
      })
      applications
    );
  in
    desktop-files // icons;
}
