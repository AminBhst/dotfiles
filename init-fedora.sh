# Enable RPM Fusion
sudo dnf -y install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf -y install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Add MongoDB Repo
cat <<EOF | sudo tee /etc/yum.repos.d/mongodb.repo
[mongodb-org-4.4]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/redhat/8/mongodb-org/4.4/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://www.mongodb.org/static/pgp/server-4.4.asc
EOF

# Install pgadmin4
wget  https://ftp.postgresql.org/pub/pgadmin/pgadmin4/yum/pgadmin4-fedora-repo-2-1.noarch.rpm
sudo rpm -Uvh pgadmin4-fedora-repo-2-1.noarch.rpm
sudo yum -y install pgadmin4-desktop

# Multimedia related
# sudo dnf install gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel
# sudo dnf install lame\* --exclude=lame-devel
# sudo dnf group upgrade --with-optional Multimedia

# Install packages
sudo dnf -y install \
  fzf \
  clang \
  ninja-build \
  gtk3-devel \
  keybinder3-devel \
  cmake \
  git \
  picom \
  alacritty \
  arandr \
  feh \
  zsh \
  neovim \
  xprop \
  NetworkManager-tui \
  network-manager-applet \
  telegram \
  mongodb-org \
  htop \
  unrar \
  vlc \
  zoxide \
  ripgrep \
  polkit-gnome \
  ffmpeg \
  pavucontrol \
  pulseaudio-utils \
  btop

# ffmpeg used for h264 codec problem in vlc
# Create Intellij symlink (used for dmenu or other menus for sway)
# (inside /usr/bin ) sudo ln -s /home/ryewell/Development/IDEs/Intellij/bin/idea.sh intellij

#  Download jetbrains font
wget https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/JetBrainsMono/NoLigatures/Regular/JetBrainsMonoNLNerdFont-Regular.ttf
  
# Add missing fzf shell file
sudo wget -P /usr/share/fzf/shell https://raw.githubusercontent.com/junegunn/fzf/master/shell/completion.zsh

# Add symlink for nekoray (Used for bemenu)
# sudo ln -s ~/General/Apps/nekoray/nekoray /usr/bin/nekoray

# Create directories
mkdir -p General/VPN/
mkdir -p Development/{Personal,Work,Tools}
