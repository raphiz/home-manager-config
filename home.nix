{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./programs/ulauncher/default.nix
    ./webapps/default.nix
  ];

  home.username = "raphiz";
  home.homeDirectory = "/home/raphiz";

  home.packages = [
    pkgs.exa
    # pkgs.hello
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  home.file = {
    ".bashrc".source = ./bash/.bashrc;
    ".bash_completion".source = ./bash/.bash_completion;

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

    ".config/Code/User/snippets/snippets/bash.code-snippets".source = ./vscode/snippets/bash.code-snippets;
    ".config/Code/User/keybindings.json".source = ./vscode/keybindings.json;
    ".config/Code/User/locale.json".source = ./vscode/locale.json;
    ".config/Code/User/settings.json".source = ./vscode/settings.json;

    ".gitconfig".source = ./git/.gitconfig;
    ".gitmessage".source = ./git/.gitmessage;
    ".gitignore".source = ./git/.gitignore;

    ".config/starship.toml".source = ./starship.toml;

    ".config/qpdfview/shortcuts.conf".source = ./qpdfview/shortcuts.conf;
  };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  programs.ulauncher.enable = true;
  webapps.enable = true;

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
