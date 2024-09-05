{ config, lib, pkgs, ... }:
{
  home.stateVersion = "23.11";
  # home.username = "sam";
  home.shellAliases = rec {
    nos = "nix-on-droid switch --flake ~/.config/nix-on-droid";
    nup = "nix flake update";
    up = "nix flake update --commit-lock-file && ${nos}";
    flake = "nix flake";
    show = "nix flake show";
    
    c = "cat";
    b = "bat --plain";
    e = "$EDITOR";
    g = "git";
    ff = "ffmpeg";
    l = "eza --icons";
    ll = "${l} -l";
    la = "${l} -a";
    lla = "${ll} -a";
    lal = "${ll} -a";
    n = "nom";
    o = "open";
  };
  home.packages = with pkgs; [
    pls
    starship
    nix-fast-build
    nix-init
    nix-output-monitor
    zellij
    zsh
    uutils-coreutils-noprefix
  ];
  news.display = "show";
  manual.manpages.enable = true;
  programs.git = {
    enable = true;
    package = pkgs.gitFull;
    userEmail = "github@samlehman.dev";
    userName = "Sam Lehman";
    lfs.enable = true;
    difftastic.enable = true;
    aliases = {
      a = "add";
      cm = "commit -m";
      ch = "checkout";
      cl = "clone";
      f = "fetch";
      l = "log";
      p = "push";
      rb = "rebase";
      s = "status";
    };
  };
  programs.helix = {
    enable = true;
    defaultEditor = true;
    settings = {
      theme = "adwaita-dark";
      editor.line-number = "relative";
    };
  };
  programs.bat = {
    enable = true;
    extraPackages = with pkgs.bat-extras; [batdiff batman batgrep batwatch];
  };
  programs.atuin.enable = true;
  programs.bottom.enable = true;
  programs.btop.enable = true;
  programs.carapace.enable = true;
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
  programs.gh.enable = true;
  programs.home-manager.enable = true;
  programs.htop.enable = true;
  programs.jq.enable = true;
  programs.k9s.enable = true;
  programs.lazygit.enable = true;
  programs.lsd.enable = true;
  programs.ripgrep.enable = true;
  programs.readline.enable = true;
  programs.navi.enable = true;
  programs.nushell = {
    enable = true;
    environmentVariables = {
      EDITOR = "hx";
      GIT_EDITOR = "hx";
    };
    shellAliases = rec {
      c = "cat";
      b = "bat --plain";
      e = "hx";
      g = "git";
      ff = "ffmpeg";
      l = "eza --icons";
      ll = "${l} -l";
      la = "${l} -a";
      lla = "${ll} -a";
      lal = "${ll} -a";
      n = "nom";
      o = "open";
    };
  };
}
