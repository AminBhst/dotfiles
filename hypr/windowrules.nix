{ ... }:

{
  wayland.windowManager.hyprland.settings = {
    windowrulev2 = [
      "opacity 0.95 override 0.75 override,class:^(Alacritty)(.*)$"
      "opacity 0.95 override 0.75 override,class:^(com.mitchellh.ghostty)(.*)$"
      "opacity 0.95 override 0.95 override,class:^(jetbrains-.*)$"
    ];

    windowrule = [
      "dimaround,class:^(jetbrains-.*)$,floating:1,title:^(?!win)"
      "center,class:^(jetbrains-.*)$,floating:1,title:^(?!win)"
      "noanim,class:^(jetbrains-.*)$,title:^(win.*)$"
      "noinitialfocus,class:^(jetbrains-.*)$,title:^(win.*)$"
      "rounding 0,class:^(jetbrains-.*)$,title:^(win.*)$"
    ];

    layerrule = [
      "blur, rofi"
    ];
  };
}
