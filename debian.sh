#!/usr/bin/env sh

sudo apt update -yy && sudo apt dist-upgrade -yy

sudo apt install build-essential git wget curl neovim libx11-dev libxft-dev libxinerama-dev libfontconfig1 apt-transport-https xorg xserver-xorg-dev -yy

sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

sudo apt update -yy

sudo apt install brave-browser -yy

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
