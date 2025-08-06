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


# Setup chaotic aur
sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key 3056513887B78AEB
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
sudo bash -c 'echo -e "\n[chaotic-aur]\nInclude = /etc/pacman.d/chaotic-mirrorlist" >> /etc/pacman.conf'
sudo pacman -Syu

# Packages
sudo pacman -S --noconfirm \
  git \
  zen-browser \
  lazygit \
  stow \
  fzf \
  unzip \
  dunst \
  cliphist \
  clang \
  rustup \
  discord \
  ninja \
  libkeybinder3 \
  libappindicator-gtk3 \
  cmake \
  python-pip \
  python-pywal \
  waybar \
  picom \
  flatpak \
  alacritty \
  ghostty \
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
  hyprpaper \
  hyprlock \
  ncdu \
  spotify-launcher \
  yt-dlp \
  bluez-utils \
  brightnessctl \
  pipewire \
  pipewire-pulse \
  wireplumber \
  archlinux-xdg-menu

#  Download jetbrains font
wget https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/JetBrainsMono/NoLigatures/Regular/JetBrainsMonoNLNerdFont-Regular.ttf

# Setup rust
rustup default stable

# Setup configs
git clone git@github.com:AminBhst/dotfiles.git ~/.dotfiles
cd dotfiles
stow */
cd ~

# Setup nvim
echo "======================= Neovim ======================="
git clone git@github.com:AminBhst/nvim.git ~/.config/nvim
mkdir -p Dev/Tools/codelldb
wget -P Dev/Tools/codelldb https://github.com/vadimcn/codelldb/releases/download/v1.11.5/codelldb-linux-x64.vsix
cd Dev/Tools/codelldb
unzip codelldb-linux-x64.vsix
rm -rf codelldb-linux-x64.vsix
cd ~
echo "======================= Neovim complete ======================="


# Setup zsh
echo "======================= zsh ======================="
chsh -s $(which zsh)
bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
echo "======================= zsh complete ======================="

# yay
echo "======================= yay ======================="
sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay-bin.git ~/.yay-bin && cd ~/.yay-bin && makepkg -si
yay
yay -S asusctl supergfxctl bluetui rofi-lbonn-wayland-git
echo "======================= yay complete ======================="

# tmux
# Use mod+shift+i to install tmux plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
cp ~/dotfiles/.tmux.conf ~/

mkdir ~/.config/xdg-desktop-portal
echo -e "[preferred]\ndefault=hyprland;gtk" > ~/.config/xdg-desktop-portal/hyprland-portals.conf

# Flatpaks
flatpak install flathub com.bitwarden.desktop

# pywal
wal -i ~/Pictures/Wallpapers/lucy-2.jpg
