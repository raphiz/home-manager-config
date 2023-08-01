{
  config,
  lib,
  pkgs,
  ...
}: {
  home.file = {
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
  };
}
