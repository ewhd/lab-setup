#!/bin/bash




# switch from NetworkManager to systemd-networkd
############################################################
# see:
# https://www.xmodulo.com/switch-from-networkmanager-to-systemd-networkd.html
# https://linux.fernandocejas.com/docs/how-to/switch-from-network-manager-to-systemd-networkd
############################################################

## enable/disable in systemctl
systemctl disable NetworkManager
systemctl enable systemd-networkd

## enable and start systemd-resolved, which networkd relies on for network
## name resolution
systemctl enable systemd-resolved
systemctl start systemd-resolved

## symlink for compatibility reasons
rm /etc/resolv.conf
ln -s /run/systemd/resolve/resolv.conf /etc/resolv.conf


# configure networks and bridges with Netplan

## the Netplan YAML file we'll be using should be in a dir in the same dir as 
## this script, so to ensure we have its path (regardless of where this script 
## is or where we are running it from, I use the following:
SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd
)/network_config/"
# from: https://stackoverflow.com/a/246128

## make backup
for f in /etc/netplan; do
    mv "$f" "$f.orig"
done

## symlink all the files in my network_config dir to /etc/netplan
ln -s $SCRIPT_DIR/* > /etc/netplan

## debug if necessary
# netplan generate
# netplan --debug apply

## apply the new Netplan configuration
netplan apply
