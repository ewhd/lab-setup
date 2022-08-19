# Install KVM/QEMU
# https://computingforgeeks.com/install-kvm-hypervisor-on-ubuntu-linux/
# apt update
# apt -y install qemu-kvm libvirt-daemon bridge-utils virtinst libvirt-daemon-system
# # Also install other useful Virtual Machine management tools.
# # This will give you tools similar to Linux ls, cat, top command for use with Virtual Machines.
# apt -y install virt-top libguestfs-tools libosinfo-bin  qemu-system virt-manager
# modprobe vhost_net 
# echo vhost_net | tee -a /etc/modules
# kvm --version >> ~/Downloads/deployerlog.txt


# https://linuxhint.com/libvirt_qemu_kvm_debian/
apt update
apt install qemu-kvm -y

# libvirt
apt install libvirt-clients libvirt-daemon-system virtinst -y
apt install libguestfs-tools -y # to edit or modify guest VM's disks and filesystems

# add user to appropriate groups
current_user=$(logname)
usermod -aG libvirt $current_user
usermod -aG libvirt-qemu $current_user
# You will need to log out and log back in for this to take effect

# virsh and starting default network
virsh net-start default
virsh net-autostart default


# virt-install command to set up a new VM was failing, and I believe this is the solution:
# hhttps://serverfault.com/a/1002063
# From https://serverfault.com/questions/1002043/libvirt-has-no-kvm-capabilities-even-though-qemu-kvm-works
chmod 666 /dev/kvm

# Despite adding users to groups above, I still couldn't use virt-install, virt-manager, etc. without sudo, 
# but by following the error log of virt-manager I found the problem was accessing /var/run/libvirt/libvirt-sock,
# so I changed the permissions. Hope that's not a problem?
chmod 666 /var/run/libvirt/libvirt-sock

# Install virt-manager
apt install virt-manager -y

# Format history
echo 'HISTTIMEFORMAT="%Y-%m-%d %T    "' >> ~/.bashrc

# Install htop
apt install htop -y
