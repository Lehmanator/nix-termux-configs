{ config, lib, pkgs, ... }:
{
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
  system.stateVersion = "23.11";


  android-integration.am.enable = true;
  android-integration.termux-open.enable = true;
  android-integration.termux-open-url.enable = true;
  android-integration.termux-reload-settings.enable = true;
  android-integration.termux-setup-storage.enable = true;
  android-integration.termux-wake-lock.enable = true;
  android-integration.termux-wake-unlock.enable = true;
  android-integration.unsupported.enable = true;
  android-integration.xdg-open.enable = true;
  build.extraProotOptions = [ ];
  

  
  nix = {
    package = pkgs.nixVersions.latest;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };
  time.timeZone = "America/New_York";
  terminal.colors = {
    background = "#000000";
    foreground = "#FFFFFF";
    cursor = "#FFFFFF";
  };
  home-manager = {
    config = ./home.nix;
    backupFileExtension = "hm-bak";
    useGlobalPkgs = true;
    useUserPackages = true;
  };

  networking.hosts = {
    "127.0.0.1" = ["localhost"];
    "192.168.0.2" = ["wyse"];
    "192.168.0.20" = ["ns"];
    "66.211.202.71" = ["home" "router"];
    "192.168.1.1" = ["router.lan"];
    
  };
}
