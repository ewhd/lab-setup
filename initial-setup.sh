thistext# A 
thistext# A 
Deactivate screen lockingDeactivate 
# Deactivate screen locking, since we're mostly running this as a headless server box via RDP
# Deactivate screen locking, since we're mostly running this as a headless server box via RDP

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


# Install gnome-tweaks
# Install gnome-tweaks
apt install gnome-tweaks
apt install gnome-tweaks
# Install gnome-tweaks
testtestinstall gnome-tweaks
