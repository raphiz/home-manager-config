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
      ".config/ulauncher/extensions.json".source = ./ulauncher/extensions.json;
      ".config/ulauncher/settings.json".source = ./ulauncher/settings.json;
      ".config/ulauncher/shortcuts.json".source = ./ulauncher/shortcuts.json;
      ".config/autostart/ulauncher.desktop".source = ./ulauncher/ulauncher.desktop;

      ".config/libreoffice/4/user/wordbook/standard.dic".source = ./libreoffice/standard.dic;

      ".config/Thunar/uca.xml".source = ./thunar/uac.xml;

      ".config/xfce4/xfconf/xfce-perchannel-xml/keyboard-layout.xml".source = ./xfce4/xfconf/keyboard-layout.xml;
      ".config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml".source = ./xfce4/xfconf/xfce4-keyboard-shortcuts.xml;
      ".config/xfce4/xfconf/xfce-perchannel-xml/xfce4-panel.xml".source = ./xfce4/xfconf/xfce4-panel.xml;
      ".config/xfce4/xfconf/xfce-perchannel-xml/xfce4-power-manager.xml".source = ./xfce4/xfconf/xfce4-power-manager.xml;
      ".config/xfce4/xfconf/xfce-perchannel-xml/xsettings.xml".source = ./xfce4/xfconf/xsettings.xml;
      ".config/xfce4/helpers.rc".source = ./xfce4/helpers.rc;
      ".config/xfce4/terminal/terminalrc".source = ./xfce4/terminalrc;
      ".config/xfce4/panel/xfce4-time-out-plugin-11.rc".source = ./xfce4/panel/xfce4-time-out-plugin-11.rc;

      ".config/mimeapps.list".source = ./mimeapps.list;

      ".gitconfig".source = ./git/.gitconfig;
      ".gitmessage".source = ./git/.gitmessage;
      ".gitignore".source = ./git/.gitignore;

      ".config/starship.toml".source = ./starship.toml;

      ".config/qpdfview/shortcuts.conf".source = ./qpdfview/shortcuts.conf;
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
