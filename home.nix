{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./modules/git/default.nix
    ./modules/starship/default.nix

    ./modules/dotfiles-xfce/default.nix
    ./modules/vscode/default.nix
    ./modules/ulauncher/default.nix
    ./modules/qpdfview/default.nix
    ./modules/webapps/default.nix
  ];

  home.username = "raphiz";
  home.homeDirectory = "/home/raphiz";

  home.packages = [
    # pkgs.hello
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  programs.ulauncher.enable = true;
  webapps.enable = true;
  programs.qpdfview.enable = true;

  programs.bash = {
    enable = true;
    historySize = 900000;
    historyFileSize = 100000;
    shellAliases = {
      diff = "delta";
      l = "ls -lah";
      top = "htop";
      sudo = "sudo "; # See https://askubuntu.com/questions/22037/aliases-not-available-when-using-sudo
      yay-update = "yay -Syu --sudoloop";
      bat = ''bat --theme=ansi --style="numbers,changes,header"'';
      cat = "bat";
    };

    profileExtra = ''
      . $HOME/.nix-profile/etc/profile.d/nix.sh
    '';

    bashrcExtra = ''
      # Source global definitions
      if [ -f /etc/bashrc ]; then
      	. /etc/bashrc
      fi
    '';

    initExtra = ''
      function o(){
        xdg-open "$*" >/dev/null 2>&1 &
      }
    '';

    sessionVariables = {
      EDITOR = "vim";
    };
  };
  programs.autojump.enable = true;

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    stdlib = ''
      # stolen from @i077; store .direnv in cache instead of project dir
      declare -A direnv_layout_dirs
      direnv_layout_dir() {
          echo "''${direnv_layout_dirs[$PWD]:=$(
              echo -n "${config.xdg.cacheHome}"/direnv/layouts/
              echo -n "$PWD" | shasum | cut -d ' ' -f 1
          )}"
      }
    '';
  };

  programs.exa = {
    enable = true;
    enableAliases = true;
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
