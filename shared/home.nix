{ config, pkgs, lib, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "caleb";
  home.homeDirectory = "/home/caleb";

  xdg = {
    enable = true;
    configFile = {
      "dunst" = {
        enable = true;
        source = ../modules/dunst;
        recursive = true;
      };
      "hypr" = {
        enable = true;
        source = ../modules/hypr;
        recursive = true;
      };
      #"dolphinrc" = {
      #  enable = true;
      #  source = ./dolphinrc;
      #};
      "kanshi" = {
        enable = true;
        source = ../modules/kanshi;
        recursive = true;
      };
      "kdeglobals" = {
        enable = true;
        source = ../modules/dolphin/kdeglobals;
      };
      "Kvantum" = {
        enable = true;
        source = ../modules/Kvantum;
        recursive = true;
      };
      "nvim" = {
        enable = true;
        source = ../modules/nvim;
        recursive = true;
      };
      # "nwg-look" = {
      #     enable = true;
      #     source = ./nwg-look;
      #     recursive = true;
      #   };
      "swww" = {
        enable = true;
        source = ../modules/swww;
        recursive = true;
      };
      "qt5ct" = {
        enable = true;
        source = ../modules/qt5ct;
        recursive = true;
      };
      "waybar" = {
        enable = true;
        source = ../modules/waybar;
        recursive = true;
      };
      "wlogout" = {
        enable = true;
        source = ../modules/wlogout;
        recursive = true;
      };
      "wofi" = {
        enable = true;
        source = ../modules/wofi;
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
    font = {
      name = "FreeSans";
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
      "ctrl+shift+enter" = "launch --cwd=current";
      "ctrl+shift+j" = "neighboring_window bottom";
      "ctrl+shift+k" = "neighboring_window top";
      "ctrl+shift+l" = "neighboring_window right";
      "ctrl+shift+h" = "neighboring_window left";
      "ctrl_shift+f" = "toggle_layout stack";
    };
    settings = {
      enabled_layouts = "fat:bias=75;full_size=1;mirrored=false,stack";
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
      # monitor = ",preferred,auto,1";
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
        "blueman-applet"
        "nm-applet --indicator"
        "~/.config/hypr/scripts/swwwallpaper.sh"
        "kanshi"
        "waybar"
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
      ];

      general = {
        gaps_in = "5";
        gaps_out = "20";
        border_size = "3";
        "col.active_border" = "rgba(7aa2f7ff) rgba(b4f9f8ff) 45deg";
        "col.inactive_border" = "rgba(24283bff)";
        layout = "dwindle";
        allow_tearing = "false";
      };

      decoration = {
        rounding = "10";
        blur = {
          enabled = "true";
          size = "5";
          passes = "1";
        };
        drop_shadow = "no";
        shadow_range = "4";
        shadow_render_power = "3";
        "col.shadow" = "rgba(1a1a1aee)";
      };

      animations = {
        enabled = "yes";
        bezier = [
          "myBezier, 0.05, 0.9, 0.1, 1.05"
          "liner, 1, 1, 1, 1"
        ];
	      animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 360, liner, loop"
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

      source = [
        "~/.config/hypr/keybindings.conf"
        "~/.config/hypr/windowrules.conf"
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

