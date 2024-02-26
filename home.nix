{ config, pkgs, lib, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "caleb";
  home.homeDirectory = "/home/caleb";

  xdg = {
    enable = true;
    configFile = {
      "hypr" = {
        enable = true;
	      source = ./hypr;
	      recursive = true;
      };
      "waybar" = {
        enable = true;
        source = ./waybar;
	      recursive = true;
      };
      "nvim" = {
        enable = true;
	      source = ./nvim;
	      recursive = true;
      };
      "dunst" = {
        enable = true;
        source = ./dunst;
        recursive = true;
      };
      "qt5ct" = {
        enable = true;
        source = ./qt5ct;
        recursive = true;
      };
      "wofi" = {
        enable = true;
        source = ./wofi;
        recursive = true;
      };
      #"dolphinrc" = {
      #  enable = true;
      #  source = ./dolphinrc;
      #};
      "kdeglobals" = {
        enable = true;
        source = ./kdeglobals;
      };
      "Kvantum" = {
        enable = true;
        source = ./Kvantum;
        recursive = true;
      };
      # "nwg-look" = {
      #     enable = true;
      #     source = ./nwg-look;
      #     recursive = true;
      #   };
      "wlogout" = {
        enable = true;
        source = ./wlogout;
        recursive = true;
      };
    };
  };

  home.file = {
    # ".local/share/dolphin" = {
    #     enable = true;
    #     source = ./dolphin;
    #     recursive = true;
    #   };
    # ".local/share/kxmlgui5" = {
    #     enable = true;
    #     source = ./kxmlgui5;
    #     recursive = true;
    #   };
    # ".icons/Tela-circle-purple" = {
    #   enable = true;
    #   source = ./Tela-circle-purple;
    #   recursive = true;
    # };
  };

  gtk = {
    enable = true;
    cursorTheme = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
    };
    iconTheme = {
      name = "Tela-circle-purple";
    };
  };

  qt = {
    enable = true;
    platformTheme = "qtct";
    style = {
      name = "kvantum";
    };
  };

  programs.git = {
    enable = true;
    aliases = {
        up = "!git remote update -p; git merge --ff-only @{u}";
      };
  };

  programs.kitty = {
    enable = true;
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 14;
    };
    shellIntegration.enableFishIntegration = true;
    theme = "Tokyo Night Storm";
    keybindings = {
      "ctrl+alt+enter" = "launch --cwd=current";
      "ctrl+shift+j" = "neighboring_window bottom";
      "ctrl+shift+k" = "neighboring_window top";
      "ctrl+shift+l" = "neighboring_window right";
      "ctrl+shift+h" = "neighboring_window left";
      "ctrl_shift+f" = "toggle_layout stack";
    };
    settings = {
      scrollback_lines = 10000;
      enable_audio_bell = false;
      confirm_os_window_close = 0;
    };
  };

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      format = lib.concatStrings [
        "[▒▓](fg:white)"
        "[ 󱄅 ](inverted fg:white)"
        "[](bg:blue fg:white)"
        "$directory"
        "[](bg:bright-black fg:blue)"
        "$git_branch"
        "$git_status"
        "[](fg:bright-black bg:black)"
        "$nodejs"
        "$rust"
        "$golang"
        "[](fg:black)"
        "\n$character"
      ];
      directory = {
        style = "inverted fg:blue";
        format = "[ $path ]($style)";
        truncation_length = 3;
        truncation_symbol = "…/";
	substitutions = {
	  "workspace" = "";
	  "Downloads" = "";
	  "Pictures" = " ";
	};
      };
      git_branch = {
        symbol = "";
        style = "bg:bright-black fg:blue";
        format = "[ $symbol $branch ]($style)";
      };
      git_status = {
        style = "bg:bright-black fg:blue";
        format = "[$all_status$ahead_behind]($style)";
      };
      nodejs = {
        symbol = "";
        style = "bg:black fg:cyan";
        format = "[ $symbol ($version) ]($style)";
      };
      golang = {
        symbol = "";
        style = "bg:black fg:cyan";
        format = "[ $symbol ($version) ]($style)";
      };
    };
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    withNodeJs = true;
    withPython3 = true;
  };

  programs.fish = {
    enable = true;
    shellAliases = {
      l = "eza -lh --icons=auto";
      ls = "eza -1";
      ll = "eza -lha --icons=auto --sort=name --group-directories-first";
      ld = "eza -lhD --icons=auto";
      lg = "lazygit";
    };
    shellInitLast = "set fish_greeting";
  };

  programs.waybar = {
    enable = true;
  };

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    xwayland.enable = true;
    settings = {
      monitor = ",preferred,auto,1";
      env = "XCURSOR_SIZE,24";
      input = {
        kb_layout = "us";
        follow_mouse = "1";
        touchpad = {
          natural_scroll = "no";
        };
        sensitivity = "0";
	force_no_accel = "1";
      };

      exec-once = [
        "waybar"
        "nm-applet --indicator"
        "blueman-applet"
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
      ];

      general = {
        gaps_in = "5";
        gaps_out = "20";
        border_size = "2";
        "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        "col.inactive_border" = "rgba(595959aa)";
        layout = "dwindle";
        allow_tearing = "false";
      };

      decoration = {
        rounding = "10";
        blur = {
          enabled = "true";
          size = "3";
          passes = "1";
        };
        drop_shadow = "yes";
        shadow_range = "4";
        shadow_render_power = "3";
        "col.shadow" = "rgba(1a1a1aee)";
      };

      animations = {
        enabled = "yes";
	bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
	animation = [
	  "windows, 1, 7, myBezier"
	  "windowsOut, 1, 7, default, popin 80%"
	  "border, 1, 10, default"
	  "borderangle, 1, 8, default"
	  "fade, 1, 7, default"
	  "workspaces, 1, 6, default"
	];
      };

      dwindle = {
        pseudotile = "yes";
	preserve_split = "yes";
	force_split = "2";
      };

      master = {
        new_is_master = "true";
      };

      gestures = {
        workspace_swipe = "true";
	workspace_swipe_fingers = "3";
      };

      misc = {
        force_default_wallpaper = "0";
      };

      "$mainMod" = "SUPER";
      "$term" = "kitty";
      "$editor" = "nvim";
      "$file" = "dolphin";
      "$browser" = "brave";
      bind = [
        "$mainMod, Q, exec, ~/.config/hypr/scripts/dontkillsteam.sh"
        "$mainMod SHIFT, Q, exit"
        "$mainMod, W, togglefloating"
        "$mainMod, F, fullscreen"
        "$mainMod, X, exec, wlogout -b 6 -c 0 -r 0 -m 0 --layout ~/.config/wlogout/layout_1 --css ~/.config/wlogout/style_1.css --protocol layer-shell"
        "$mainMod, T, exec, $term"
        "$mainMod, E, exec, $file"
        "$mainMod, A, exec, pkill wofi || wofi"
        "$mainMod, tab, exec, pkill -x rofi || ~/.config/hypr/scripts/rofilaunch.sh w"
        "$mainMod, R, exec, pkill -x rofi || ~/.config/hypr/scripts/rofilaunch.sh f"
        "$mainMod, P, exec, ~/.config/hypr/scripts/screenshot.sh s"
        "$mainMod CTRL, P, exec, ~/.config/hypr/scripts/screenshot.sh sf"
        "$mainMod ALT, P, exec, ~/.config/hypr/scripts/screenshot.sh m"
        ",print, exec, ~/.config/hypr/scripts/screenshot.sh p"
        
        "$mainMod ALT, G, exec, ~/.config/hypr/scripts/gamemode.sh"
        "$mainMod ALT, right, exec, ~/.config/hypr/scripts/swwwallpaper.sh -n"
        "$mainMod ALT, left, exec, ~/.config/hypr/scripts/swwwallpaper.sh"
        "$mainMod SHIFT, D, exec, ~/.config/hypr/scripts/wallbashtoggle.sh"
        "$mainMod SHIFT, T, exec, pkill -x rofi || ~/.config/hypr/scripts/themeselect.sh"
        "$mainMod SHIFT, A, exec, pkill -x rofi || ~/.config/hypr/scripts/rofiselect.sh"
        "$mainMod SHIFT, W, exec, pkill -x rofi || ~/.config/hypr/scripts/swwwallselect.sh"
        "$mainMod, V, exec, pkill -x rofi || ~/.config/hypr/scripts/cliphist.sh c"
        
        "$mainMod, H, movefocus, l"
        "$mainMod, L, movefocus, r"
        "$mainMod, K, movefocus, u"
        "$mainMod, J, movefocus, d"
        
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"

        "$mainMod SHIFT $CONTROL, left, movewindow, l"
        "$mainMod SHIFT $CONTROL, right, movewindow, r"
        "$mainMod SHIFT $CONTROL, up, movewindow, u"
        "$mainMod SHIFT $CONTROL, down, movewindow, d"

        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"

        "$mainMod ALT, S, movetoworkspacesilent, special"
        "$mainMod, S, togglespecialworkspace"

        "$mainMod, G, togglesplit"

        "$mainMod ALT, 1, movetoworkspacesilent, 1"
        "$mainMod ALT, 2, movetoworkspacesilent, 2"
        "$mainMod ALT, 3, movetoworkspacesilent, 3"
        "$mainMod ALT, 4, movetoworkspacesilent, 4"
        "$mainMod ALT, 5, movetoworkspacesilent, 5"
        "$mainMod ALT, 6, movetoworkspacesilent, 6"
        "$mainMod ALT, 7, movetoworkspacesilent, 7"
        "$mainMod ALT, 8, movetoworkspacesilent, 8"
        "$mainMod ALT, 9, movetoworkspacesilent, 9"
        "$mainMod ALT, 0, movetoworkspacesilent, 10"
      ];
      bindl = [
        ", XF86AudioMute, exec, ~/.config/hypr/scripts/volumecontrol.sh -o m"
        ", XF86AudioMicMute, exec, ~/.config/hypr/scripts/volumecontrol.sh -i m"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPause, exec, playerctl play-pause"
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPrev, exec, playerctl previous"

        ", switch:on:Lid Switch, exec, swaylock && systemctl suspend"
      ];
      bindel = [
        ", XF86AudioLowerVolume, exec, ~/.config/hypr/scripts/volumecontrol.sh -o d"
        ", XF86AudioRaiseVolume, exec, ~/.config/hypr/scripts/volumecontrol.sh -o i"
        ", XF86MonBrightnessUp, exec, ~/.config/hypr/scripts/brightnesscontrol.sh i"
        ", XF86MonBrightnessDown, exec, ~/.config/hypr/scripts/brightnesscontrol.sh d"
      ];
      binde = [
        "$mainMod SHIFT, right, resizeactive, 30 0"
        "$mainMod SHIFT, left, resizeactive, -30 0"
        "$mainMod SHIFT, up, resizeactive, 0 -30"
        "$mainMod SHIFT, down, resizeactive, 0 30"
      ];
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];
    };
  };

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    (pkgs.tela-circle-icon-theme.override { colorVariants = [ "purple" ]; })
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/caleb/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
