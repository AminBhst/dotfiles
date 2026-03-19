{ ... }:

{
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "dunst"
      "waybar"
      "hyprpaper"
      "/run/current-system/sw/libexec/polkit-kde-authentication-agent-1"
      "nm-applet --indicator"
      "workstyle &> /tmp/workstyle.log"
      "wl-paste --watch cliphist store"
    ];

    exec = [
      ''gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"''
      ''gsettings set org.gnome.desktop.interface gtk-theme "adw-gtk3"''
    ];
  };
}
