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
apt install xrdp -y
systemctl enable --now xrdp
ufw allow from any to any port 3389 proto tcp

# Install gnome-tweaks
apt install gnome-tweaks -y

# Set dark mode as default ()
gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'

# Auto-open gnome-terminal upon login
echo "[Desktop Entry]
Type=Application
Exec=gnome-terminal
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
Name[en_NG]=Terminal
Name=Terminal
Comment[en_NG]=Start Terminal On Startup
Comment=Start Terminal On Startup" >> ~/.config/autostart/gnome-terminal.desktop

# Install the locate command
apt install plocate -y

# Install xdg-utils
apt install xdg-utils -y


# Install vim-gtk (which has things like the +clipboard feature, which just vim doesn't for some reason)
apt install vim-gtk -y

# Install ranger terminal file manager
apt install ranger -y

# Install Tmux
apt install tmux -y

# Install Zsh
apt install zsh -y

# Install stow
apt install stow -y
