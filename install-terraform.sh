


# Install Terraform
# https://computingforgeeks.com/how-to-install-terraform-on-linux/

## Download tarball
TER_VER=`curl -s https://api.github.com/repos/hashicorp/terraform/releases/latest | grep tag_name | cut -d: -f2 | tr -d \"\,\v | awk '{$1=$1};1'`
wget https://releases.hashicorp.com/terraform/${TER_VER}/terraform_${TER_VER}_linux_amd64.zip

## Unzip and move
unzip terraform_${TER_VER}_linux_amd64.zip
sudo mv terraform /usr/local/bin/


# Install Terraform KVM provider
# https://computingforgeeks.com/how-to-provision-vms-on-kvm-with-terraform/

## Create and enter terraform projects dir
mkdir -p ~/projects/terraform
cd ~/projects/terraform

## Set main.tf to seek out the KVM provider 
echo "terraform {
  required_providers {
      libvirt = {
            source = "dmacvicar/libvirt"
                }
                  }
              }

              provider "libvirt" {
                # Configuration options
            }" >> main.tf

