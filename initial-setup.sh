# A script of all the commands I ran to get my lab set-up
# This is not necessarily tested -- it's more like live notes of my process which *might* run as a script
# Some of this I cribbed from https://github.com/lee5378/labsetup/blob/main/labsetup.sh

# Deactivate screen locking, since we're mostly running this as a headless server box via RDP
gsettings set org.gnome.desktop.screensaver lock-enabled false

# cd ~/Downloads
# touch deployerlog.txt

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

# Install curl
apt install curl -y
curl --version >> ~/Downloads/deployerlog.txt

# Install gnome-tweaks
apt install gnome-tweaks

# Install VS Code
apt install software-properties-common apt-transport-https wget -y
# this next line needed some modification/updating: https://www.linuxuprising.com/2021/01/apt-key-is-deprecated-how-to-add.html
# wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | apt-key add -
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | tee /usr/share/keyrings/microsoft-archive-keyr
ing.gpg
add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
apt install code -y
code --version >> ~/Downloads/deployerlog.txt 


