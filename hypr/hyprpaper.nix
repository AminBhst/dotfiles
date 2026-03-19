{ ... }:

{
  services.hyprpaper = {
    enable = true;

    settings = {
      preload = [
        "/home/ryewell/Pictures/Wallpapers/lucy-2.jpg"
      ];

      wallpaper = [
        "HDMI-A-1,/home/ryewell/Pictures/Wallpapers/lucy-2.jpg"
        "DP-3,/home/ryewell/Pictures/Wallpapers/lucy-2.jpg"
      ];
    };
  };
}
