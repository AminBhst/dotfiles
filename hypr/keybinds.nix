{ ... }:

{
  wayland.windowManager.hyprland.settings = {
    "$mainMod" = "SUPER";

    bind = [
      "$mainMod_SHIFT, T, exec, bash ~/.config/hypr/scripts/disable-touchpad.sh"
      "$mainMod_CTRL, Return, exec, alacritty"
      "$mainMod, Q, killactive"
      "$mainMod, E, exec, dolphin"
      "$mainMod, V, togglefloating"
      "$mainMod, R, exec, rofi -show drun -modi drun,filebrowser,run,window"
      "$mainMod, F, fullscreen, 1"
      "$mainMod_SHIFT, F, fullscreen, 0"
      "ALT, V, exec, cliphist list | wofi --dmenu | cliphist decode | wl-copy"
      "$mainMod, M, exec, bemenu-run --fb \"##24273a\" --ff \"##cad3f5\" --nb \"##24273a\" --nf \"##cad3f5\" --tb \"##24273a\" --hb \"##24273a\" --tf \"##ed8796\" --hf \"##eed49f\" --nf \"##cad3f5\" --af \"##cad3f5\" --ab \"##24273a\""
      ", Print, exec, hyprshot -m region --clipboard-only"
      "$mainMod, H, exec, hyprshot -m region --clipboard-only"
      "ALT_SHIFT, D, exec, hyprctl keyword monitor \"eDP-1,disable\""
      "ALT_SHIFT, E, exec, hyprctl keyword monitor \"eDP-1,enable\""
      "ALT_SHIFT, L, exec, hyprlock"
      "$mainMod, B, exec, firefox"
      "$mainMod, left, movefocus, l"
      "$mainMod, right, movefocus, r"
      "$mainMod, up, movefocus, u"
      "$mainMod, down, movefocus, d"
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
      "$mainMod, S, togglespecialworkspace, magic"
      "$mainMod SHIFT, S, movetoworkspace, special:magic"
      "$mainMod, mouse_down, workspace, e+1"
      "$mainMod, mouse_up, workspace, e-1"
      "$mainMod, Tab, cyclenext"
    ];

    bindm = [
      "$mainMod, mouse:272, movewindow"
      "$mainMod, mouse:273, resizewindow"
    ];
  };
}
