{
  config,
  pkgs,
  ...
}: let
  md2confluence = pkgs.writeShellApplication {
    name = "md2confluence";
    runtimeInputs = [pkgs.pandoc];
    text = ''
      pandoc -f gfm-gfm_auto_identifiers -w jira "$1" | sed 's/{anchor:}//g' | xclip -selection clipboard
      echo "copied to the clipboard"
    '';
  };
in {
  imports = [
    ./starship/default.nix
  ];
  home.packages = [
    pkgs.ast-grep
    pkgs.jless
    md2confluence
  ];
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
      # https://github.com/direnv/direnv/wiki/Customizing-cache-location
      declare -A direnv_layout_dirs
      direnv_layout_dir() {
          echo "''${direnv_layout_dirs[$PWD]:=$(
              echo -n "${config.xdg.cacheHome}"/direnv/layouts/
              echo -n "$PWD" | sha256sum | cut -d ' ' -f 1
          )}"
      }
    '';
  };

  programs.exa = {
    enable = true;
    enableAliases = true;
  };
}
