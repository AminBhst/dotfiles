echo "Have you set up your SSH key for GitHub? (yes/no)"
read -r answer

if [[ "${answer,,}" != "yes" && "${answer,,}" != "y" ]]; then
    echo "Please set up your SSH key for GitHub before proceeding."
    exit 1
fi

cd ~

# Fonts
sudo pacman -S --noconfirm \
  ttf-jetbrains-mono-nerd \
  noto-fonts \
  noto-fonts-emoji \
  ttf-dejavu \
  ttf-liberation \
  fonts-meta-base \
  noto-fonts \
  noto-fonts-extra \
  noto-fonts-emoji


# Packages
sudo pacman -S --noconfirm \
  git \
  lazygit \
  stow \
  fzf \
  dunst \
  clang \
  discord \
  ninja \
  libkeybinder3 \
  libappindicator-gtk3 \
  cmake \
  waybar \
  picom \
  flatpak \
  alacritty \
  feh \
  zsh \
  neovim \
  tmux \
  network-manager-applet \
  telegram-desktop \
  base-devel \
  htop \
  btop \
  unrar \
  vlc \
  zoxide \
  ripgrep \
  polkit-gnome \
  ffmpeg \
  pavucontrol \
  grim \
  wl-clipboard \
  libimobiledevice \
  usbmuxd \
  xdg-desktop-portal-gtk \
  xdg-desktop-portal-hyprland \
  ncdu \
  spotify-launcher \
  yt-dlp \
  bluez-utils \
  brightnessctl \
  pipewire \
  pipewire-pulse \
  wireplumber

#  Download jetbrains font
wget https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/JetBrainsMono/NoLigatures/Regular/JetBrainsMonoNLNerdFont-Regular.ttf

# Setup configs
git clone git@github.com:AminBhst/dotfiles.git ~/.dotfiles
stow -d ~/.dotfiles -t ~ */

# Setup nvim
git clone git@github.com:AminBhst/nvim.git ~/.config/nvim
  
# Setup zsh
sudo wget -P /usr/share/fzf/shell https://raw.githubusercontent.com/junegunn/fzf/master/shell/completion.zsh
sudo wget -P /usr/share/fzf/shell https://raw.githubusercontent.com/junegunn/fzf/master/shell/key-bindings.zsh
chsh -s $(which zsh)

# yay
sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay-bin.git ~/.yay-bin && cd ~/.yay-bin && makepkg -si
yay
yay -S asusctl supergfxctl bluetui rofi-lbonn-wayland-git

# tmux
# Use mod+shift+i to install tmux plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
cp ~/dotfiles/.tmux.conf ~/

mkdir ~/.config/xdg-desktop-portal
echo -e "[preferred]\ndefault=hyprland;gtk" > ~/.config/xdg-desktop-portal/hyprland-portals.conf
