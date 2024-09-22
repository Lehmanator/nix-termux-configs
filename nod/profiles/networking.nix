{ inputs, config, lib, pkgs, ... }:
{
  networking.hosts = {
    "127.0.0.1" = ["localhost"];
    "192.168.1.2" = ["wyse"];
    "192.168.1.20" = ["ns"];
    "66.211.202.71" = ["home" "router"];
    "192.168.1.1" = ["router.lan"];
  };
}
