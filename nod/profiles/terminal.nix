{ inputs, ... }:
{ config, lib, pkgs, ... }:
{
  environment.motd = ''
    Welcome to Nix-on-Droid!
    If nothing works, open an issue at https://github.com/nix-community/nix-on-droid/issues or try the rescue shell.
    Options: https://nix-community.github.io/nix-on-droid/nix-on-droid-options.html
  '';
  terminal.colors = {
    background = "#000000";
    foreground = "#FFFFFF";
    cursor = "#FFFFFF";
  };

  # Variants: {,Mono,Propo}-{Bold,Light,Medium,Regular,Retina,SemiBold}
  terminal.font = "${pkgs.fira-code-nerdfont}/share/fonts/truetype/NerdFonts/FiraCodeNerdFont-Retina.ttf";
}
