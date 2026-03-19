{ ... }:

{
  wayland.windowManager.hyprland.settings.env = [
    "LIBVA_DRIVER_NAME,nvidia"
    "XDG_SESSION_TYPE,wayland"
    "__GLX_VENDOR_LIBRARY_NAME,nvidia"
    "WLR_NO_HARDWARE_CURSORS,1"
    "QT_QPA_PLATFORMTHEME,qt6ct"
    "XDG_MENU_PREFIX,arch-"
  ];
}
