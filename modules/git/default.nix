{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.git = {
    enable = true;
    lfs.enable = true;

    userName = "Raphael Zimmermann";
    userEmail = lib.mkDefault "mail@raphael.li";

    aliases = {
      a = "add --patch";
      st = "status";
      co = "commit";
      unstage = "reset";
      l = "log --oneline --decorate";
      amend = "commit --amend --no-edit";
      uncommit = "reset --soft HEAD~1";
      sla = "log --oneline --decorate --graph --all";
      new = "l main..HEAD";
      missing = "l HEAD..main";
    };

    ignores = [
      ".idea/codeStyles/Project.xml"
    ];
    includes = [
      {path = "~/.gitlocal";}
    ];
    iniContent = {
      core = {
        whitespace = "warn";
        autocrlf = "input";
      };
      commit = {
        template = "~/.config/git/gitmessage";
      };
      pull = {
        ff = "only";
      };
      merge = {
        conflictstyle = "diff3";
      };
      init = {
        defaultBranch = "main";
      };
      push = {
        default = "current";
        autoSetupRemote = "true";
      };
      rebase = {
        autoSquash = "true";
        autoStash = "true";
      };
      diff = {
        colorMoved = "default";
      };
    };
  };

  programs.git.delta = {
    enable = true;
    options = {
      # use n and N to move between diff sections
      navigate = true;
      # set to true if you're in a terminal w/ a light background color (e.g. the default macOS terminal)
      light = true;
      side-by-side = true;
    };
  };

  home.file = {
    ".config/git/gitmessage".source = ./gitmessage;
  };
}
