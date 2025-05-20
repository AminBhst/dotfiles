echo "Have you set up your SSH key for GitHub? (yes/no)"
read -r answer

if [[ "${answer,,}" != "yes" && "${answer,,}" != "y" ]]; then
    echo "Please set up your SSH key for GitHub before proceeding."
    exit 1
fi

cd ~

# Fonts
sudo pacman -S --noconfirm \
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
  ninja-build \
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
  xprop \
  NetworkManager-tui \
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
  shutter \
  libimobiledevice \
  usbmuxd

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
