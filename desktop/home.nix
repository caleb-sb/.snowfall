{ config, pkgs, lib, ... }:

{
  imports = [
    ../shared/home.nix
  ];

  home.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = 1;
  };

  home.packages = with pkgs; [
    blender_4_0
    cura
    discord
    gparted
    steam
  ];
}

