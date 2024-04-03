{ config, pkgs, lib, ... }:

{
  imports = [
    ../shared/home.nix
  ];

  home.packages = with pkgs; [
    postman

    ## ios browser debug
    libtool
    libplist
    libimobiledevice-glue
    libusbmuxd
    libimobiledevice
    usbmuxd
    ios-webkit-debug-proxy
    killall
  ];
}
