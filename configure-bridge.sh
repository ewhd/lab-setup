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

## the Netplan YAML file we'll be using should be in the same dir as this
## script, so to ensure we have its path (regardless of where this script is
## or where we are running it from, I use the following:
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
# from: https://stackoverflow.com/a/246128

## move to Netplan
cd /etc/netplan

## make backup
for f in *; do
    cp "$f" "$f.orig"
done

## overwrite contents of YAML with my own
cat $SCRIPT_DIR/custom-netplan-network-config.yaml > 01-network-manager-all.yaml

## debug if necessary
# netplan generate
# netplan --debug apply

## apply the new Netplan configuration
netplan apply
