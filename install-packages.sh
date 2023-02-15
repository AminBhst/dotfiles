sudo dnf install gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel
sudo dnf install lame\* --exclude=lame-devel
sudo dnf group upgrade --with-optional Multimedia
sudo dnf install --allowerasing i3-gaps
sudo dnf install \
  fzf \
  clang \
  ninja-build \
  gtk3-devel \
  cmake \
  git \
  picom \
  feh \
  alacritty \
  arandr \
  feh \
  zsh \
  neovim \
  xprop \
  NetworkManager-tui \
