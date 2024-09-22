{ inputs, self
, config, lib, pkgs
, ...
}:
{
  imports = with inputs; [
    sops-nix.homeManagerModules.sops
    #self+/nod/profiles/aliases.nix
    #self+/nod/profiles/ffmpeg.nix
    self+/nod/profiles/nix.nix
    #self+/nod/profiles/nixpkgs.nix
    #self+/nod/profiles/packages.nix
    self+/nod/profiles/git.nix
    self+/nod/profiles/helix.nix
    self+/nod/profiles/nushell.nix
    # self+/nod/profiles/rust.nix
    self+/nod/profiles/ssh.nix
    self+/nod/profiles/xdg.nix
    self+/nod/profiles/zsh.nix
  ];
  
  home = {
    stateVersion = "23.11";
    # username = "sam";
    sessionPath = [
      "$HOME/.local/bin"
    ];
    sessionVariables = {
      VISUAL = "termux-open";
    };
    shellAliases = rec {
      c = "cat";
      b = "bat --plain";
      e = "$EDITOR";
      ff = "ffmpeg";

      # --- Dirs ---
      l = "eza --icons";
      ll = "${l} -l";
      la = "${l} -a";
      lla = "${ll} -a";
      lal = "${ll} -a";
      lt = "${l} --tree";
      
      o = "open";
    };
    packages = with pkgs; [
      pls
      starship
      zellij
      uutils-coreutils-noprefix
      which
    ];
  };
  news.display = "show";
  manual.manpages.enable = true;

  xdg.configFile."nixpkgs/config.nix".source = self+/nixpkgs-config.nix;
  nixpkgs = {
    config = import self+/nixpkgs-config.nix;
    overlays = [];
  };
  
  programs.atuin.enable = true;
  programs.bat = {
    enable = true;
    extraPackages = with pkgs.bat-extras; [batdiff batman batgrep batwatch];
  };
  programs.bottom.enable = true;
  programs.btop.enable = true;
  programs.command-not-found.enable = true;
  programs.eza = {
    enable = true;
    git = true;
    icons = true;
    extraOptions = ["--group-directories-first"];
  };
  programs.fastfetch.enable = true;
  programs.fd.enable = true;
  programs.fzf.enable = true;
  programs.gallery-dl.enable = true;
  programs.gpg = {
    enable = true;
    homedir = "${config.xdg.dataHome}/gnupg";
  };
  programs.home-manager.enable = true;
  programs.htop.enable = true;
  programs.jq.enable = true;
  programs.k9s.enable = true;
  programs.lsd.enable = true;
  programs.ripgrep.enable = true;
  programs.readline.enable = true;
  programs.navi.enable = true;
}
