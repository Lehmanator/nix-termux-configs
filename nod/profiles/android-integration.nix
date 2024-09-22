{ inputs, config, lib, pkgs, ... }:
{
  android-integration = {
    am.enable = true;
    termux-open.enable = true;
    termux-open-url.enable = true;
    termux-reload-settings.enable = true;
    termux-setup-storage.enable = true;
    termux-wake-lock.enable = true;
    termux-wake-unlock.enable = true;
    unsupported.enable = true;
    xdg-open.enable = true;
  };
  build.extraProotOptions = [ ];
  terminal.colors = {
    background = "#000000";
    foreground = "#FFFFFF";
    cursor = "#FFFFFF";
  };
}
