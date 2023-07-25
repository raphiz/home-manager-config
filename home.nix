{
  config,
  pkgs,
  ...
}: {
  home.username = "raphiz";
  home.homeDirectory = "/home/raphiz";

  home.packages = [
    # pkgs.hello
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  home.file = let
    applications = builtins.attrNames (builtins.readDir ./applications);
    desktop-files = builtins.listToAttrs (
      map (name: {
        name = ".local/share/applications/${name}.desktop";
        value = {source = ./applications/${name}/${name}.desktop;};
      })
      applications
    );
    icons = builtins.listToAttrs (
      map (name: {
        name = ".local/share/icons/hicolor/128x128/apps/${name}.png";
        value = {source = ./applications/${name}/${name}.png;};
      })
      applications
    );
    files = {
      ".config/ulauncher/extensions.json".text = builtins.readFile ./ulauncher/extensions.json;
      ".config/ulauncher/settings.json".text = builtins.readFile ./ulauncher/settings.json;
      ".config/ulauncher/shortcuts.json".text = builtins.readFile ./ulauncher/shortcuts.json;
      ".config/autostart/ulauncher.desktop".text = builtins.readFile ./ulauncher/ulauncher.desktop;

      ".config/libreoffice/4/user/wordbook/standard.dic".text = builtins.readFile ./libreoffice/standard.dic;

      ".gitconfig".text = builtins.readFile ./git/.gitconfig;
      ".gitmessage".text = builtins.readFile ./git/.gitmessage;
      ".gitignore".text = builtins.readFile ./git/.gitignore;

      ".config/starship.toml".text = builtins.readFile ./starship.toml;

      ".config/qpdfview/shortcuts.conf".text = builtins.readFile ./qpdfview/shortcuts.conf;
    };
  in
    desktop-files // icons // files;

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.05"; # Please read the comment before changing.
}
