{ config, pkgs, lib, ... }:

{
  imports = [
    ../shared/home.nix
  ];

  home.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = 1;
  };

  xdg.desktopEntries.discord = {
    name = "Discord";
    genericName = "All-in-one cross-platform voice and text chat for gamer";
    exec = "discord --disable-gpu";
    icon = "discord";
    type = "Application";
    categories = ["Network" "InstantMessaging"];
    mimeType = ["x-scheme-handler/discord"];
  };

  home.packages = with pkgs; [
    freecad
    blender_4_0
    cura
    discord
    gparted
    steam
  ];
}

