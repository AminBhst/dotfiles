{ ... }:

{
  imports = [
    ./startup.nix
    ./windowrules.nix
    ./keybinds.nix
    ./env.nix
    ./animation.nix
    ./hyprpaper.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      monitor = [
        ",highrr,auto,1"
        "DP-3,2560x1440@240.00Hz,0x0,1"
      ];

      input = {
        kb_layout = "us, ir";
        kb_variant = "";
        kb_model = "";
        kb_options = "grp:win_space_toggle";
        kb_rules = "";
        follow_mouse = 1;

        touchpad = {
          natural_scroll = false;
        };

        sensitivity = 0;
      };

      cursor = {
        no_hardware_cursors = true;
      };

      general = {
        gaps_in = 5;
        gaps_out = 15;
        border_size = 1;
        "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        "col.inactive_border" = "rgba(595959aa)";
      };

      decoration = {
        rounding = 5;

        blur = {
          enabled = true;
          size = 3;
          passes = 1;
        };
      };
    };
  };
}
