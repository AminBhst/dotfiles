# Enable RPM Fusion
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Add MongoDB Repo
cat <<EOF | sudo tee /etc/yum.repos.d/mongodb.repo
[mongodb-org-4.4]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/redhat/8/mongodb-org/4.4/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://www.mongodb.org/static/pgp/server-4.4.asc
EOF

# Install pgsql 10
sudo dnf install https://download.postgresql.org/pub/repos/yum/10/fedora/fedora-37-x86_64/postgresql10-libs-10.22-2PGDG.f37.x86_64.rpm
sudo dnf install https://download.postgresql.org/pub/repos/yum/10/fedora/fedora-37-x86_64/postgresql10-10.22-2PGDG.f37.x86_64.rpm
sudo dnf install https://download.postgresql.org/pub/repos/yum/10/fedora/fedora-37-x86_64/postgresql10-contrib-10.22-2PGDG.f37.x86_64.rpm
sudo dnf install https://download.postgresql.org/pub/repos/yum/10/fedora/fedora-37-x86_64/postgresql10-devel-10.22-2PGDG.f37.x86_64.rpm
sudo dnf install https://download.postgresql.org/pub/repos/yum/10/fedora/fedora-37-x86_64/postgresql10-plperl-10.22-2PGDG.f37.x86_64.rpm
sudo dnf install https://download.postgresql.org/pub/repos/yum/10/fedora/fedora-37-x86_64/postgresql10-plpython3-10.22-2PGDG.f37.x86_64.rpm
sudo dnf install https://download.postgresql.org/pub/repos/yum/10/fedora/fedora-37-x86_64/postgresql10-pltcl-10.22-2PGDG.f37.x86_64.rpm
sudo dnf install https://download.postgresql.org/pub/repos/yum/10/fedora/fedora-37-x86_64/postgresql10-server-10.22-2PGDG.f37.x86_64.rpm
sudo dnf install https://download.postgresql.org/pub/repos/yum/10/fedora/fedora-37-x86_64/postgresql10-test-10.22-2PGDG.f37.x86_64.rpm

# Init pgsql
sudo /usr/pgsql-10/bin/postgresql-10-setup initdb
sudo systemctl enable postgresql-10
sudo systemctl start postgresql-10


# Multimedia related
sudo dnf install gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel
sudo dnf install lame\* --exclude=lame-devel
sudo dnf group upgrade --with-optional Multimedia

# Install i3
sudo dnf install --allowerasing i3-gaps

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
  telegram \
  mongodb-org \
  htop \
  unrar \
  vlc \


# Create directories
mkdir -p General/VPN/
mkdir -p Development/{Personal,Work,Tools}
