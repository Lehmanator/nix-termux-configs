{ inputs, ... }:
{ config, lib, pkgs, ... }:
{
  # https://nix-community.github.io/nix-on-droid/nix-on-droid-options.html
  # build.extraProotOptions = [ ];
  system.stateVersion = "23.11";
  user = {
    shell = "${pkgs.zsh}/bin/zsh";
    # userName = "sam";
    # group = "users";
  };
  environment.packages = with pkgs; [
    vim
    #procps
    #killall
    #diffutils
    #findutils
    #utillinux
    #tzdata
    #hostname
    #man
    #gnugrep
    #gnupg
    #gnused
    #gnutar
    #bzip2
    #gzip
    #xz
    #zip
    #unzip
  ];
  environment.etcBackupExtension = ".bak";
  environment.motd = ''
    Welcome to Nix-on-Droid!
    If nothing works, open an issue at https://github.com/nix-community/nix-on-droid/issues or try the rescue shell.
    Options: https://nix-community.github.io/nix-on-droid/nix-on-droid-options.html
  '';
}
