{ inputs, ... }:
{ config, lib, pkgs, ... }:
{
  home = {
    username = "sam";
    stateVersion = "23.11";
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

  xdg.configFile."nixpkgs/config.nix".source = (inputs.self + /nixpkgs-config.nix);
  # nixpkgs = {
  #   config = import (inputs.self + /nixpkgs-config.nix);
  #   overlays = [];
  # };
  
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
