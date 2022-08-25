# lab-setup

A collection of scripts to recreate my lab environment should I want to copy or recreate it.

This is specific to my configuration and meant to be run on Ubuntu22.04. This is not tested on any other environment. Run at your own risk.

### Contents:
- [initial-setup.sh](https://github.com/ewhd/lab-setup/blob/master/initial-setup.sh) - install my preferred common utilities and set a few configurations.
- [set-up-dotfiles.sh](https://github.com/ewhd/lab-setup/blob/master/set-up-dotfiles.sh) - clone down my [.dotfiles repo](https://github.com/ewhd/.dotfiles) (this does not fully set up my environment -- you must still run `stow` commands).
- [install-qemu-kvm.sh](https://github.com/ewhd/lab-setup/blob/master/install-qemu-kvm.sh) - install and configure QEMU-KVM and associated utilities.
- [configure-bridge.sh](https://github.com/ewhd/lab-setup/blob/master/configure-bridge.sh) - set network manager to `networkd`, then backup and replace the Netplan YAML file with my own.
- [custom-network-plan.yaml](https://github.com/ewhd/lab-setup/blob/master/custom-netplan-network-config.yaml) - a Netplan config file to enable a second ethernet device and attach a virtual bridge to it.
- [install-terraform.sh](https://github.com/ewhd/lab-setup/blob/master/install-terraform.sh) - install Terraform and KVM provider.
