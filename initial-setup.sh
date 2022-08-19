# A script of all the commands I ran to get my lab set-up
# This is not a finished product -- it's more like live notes of my process which *might* run as a script
# Some of this I cribbed from https://github.com/lee5378/labsetup/blob/main/labsetup.sh

# Deactivate screen locking -- convenient if you're mostly running this as a headless server box via RDP
gsettings set org.gnome.desktop.screensaver lock-enabled false

apt-get update
apt-get upgrade -y

apt update
apt upgrade -y

# Install Open SSH Server, allow firewall, and launch the service on startup
apt-get install openssh-server -y
systemctl start sshd
ufw allow ssh
systemctl enable ssh

# Install xrdp
apt install xrdp
systemctl enable --now xrdp
ufw allow from any to any port 3389 proto tcp

# Install gnome-tweaks
apt install gnome-tweaks

# Install Ranger
apt install ranger

# Install Vim
apt install vim

# Install Tmux
apt install tmux

# Install Zsh
apt install zsh

# Install stow
apt install stow
