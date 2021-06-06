#!/usr/bin/env sh

sudo apt update -yy && sudo apt dist-upgrade -yy

sudo apt install xdg-user-dirs build-essential git wget curl neovim apt-transport-https xorg xserver-xorg-dev -yy

# Suckless dependences
sudo apt install libx11-dev libxft-dev libx11-xcb-dev libxcb-res0-dev libharfbuzz-dev libxinerama-dev libfontconfig1 -yy

sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

sudo apt update -yy

sudo apt install brave-browser -yy

#
# Setup the repository
#

# Install the public key for the repository (if not done previously):
sudo curl https://www.pgadmin.org/static/packages_pgadmin_org.pub | sudo apt-key add

# Create the repository configuration file:
sudo sh -c 'echo "deb https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$(lsb_release -cs) pgadmin4 main" > /etc/apt/sources.list.d/pgadmin4.list && apt update'

#
# Install pgAdmin
#

# Repo update
sudo apt update -yy

# Install for both desktop and web modes:
sudo apt install pgadmin4 -yy

# Install for desktop mode only:
sudo apt install pgadmin4-desktop -yy

# Install for web mode only:
sudo apt install pgadmin4-web  -yy

# Configure the webserver, if you installed pgadmin4-web:
sudo /usr/pgadmin4/bin/setup-web.sh

cd

mkdir -p .local/bin
mkdir -p .local/src

cd ~/.local/src

git clone git://git.suckless.org/dwm

git clone git://git.suckless.org/dmenu

git clone git://git.suckless.org/st

cd ~/.local/src/dwm

make

cd ~/.local/src/dmenu

make

cd ~/.local/src/st

make

cd ~/.local/bin

ln -sf ~/.local/src/dwm/dwm ~/.local/bin/
ln -sf ~/.local/src/dmenu/dmenu ~/.local/bin/
ln -sf ~/.local/src/dmenu/dmenu_run ~/.local/bin/
ln -sf ~/.local/src/dmenu/dmenu_path ~/.local/bin/
ln -sf ~/.local/src/st/st ~/.local/bin/

echo 'exec dwm' > .xinitrc

echo 'Install finish!!'
exit
