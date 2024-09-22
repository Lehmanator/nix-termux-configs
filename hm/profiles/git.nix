{ inputs, ... }:
{ config, lib, pkgs, ... }:
{
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
  programs.gh = {
    enable = true;
    gitCredentialHelper = {
      enable = true;
      hosts = ["https://github.com" "https://gist.github.com"];
    };
    extensions = with pkgs; [gh-eco];
    settings = {
      git_protocol = "ssh";
      prompt = "enabled";
      editor = "hx";
      aliases = {
        co = "pr checkout";
        pv = "pr view";
      };
    };
  };
  programs.gh-dash = {
    enable = true;
    settings = {};
  };
  programs.lazygit.enable = true;
  home.sessionVariables.GIT_EDITOR = config.home.sessionVariables.EDITOR;
  home.shellAliases.g = "git";
  programs.zsh.zsh-abbr.abbreviations.g = "git";

  # programs.zsh.shellGlobalAliases.g = "git";
  # programs.zsh.shellAliases.g = "git";
  # programs.nushell.shellAliases.g = "git";
  
}
