# Install Terraform
# https://computingforgeeks.com/how-to-install-terraform-on-linux/
TER_VER=`curl -s https://api.github.com/repos/hashicorp/terraform/releases/latest | grep tag_name | cut -d: -f2 | tr -d \"\,\v | awk '{$1=$1};1'`
wget https://releases.hashicorp.com/terraform/${TER_VER}/terraform_${TER_VER}_linux_amd64.zip

# Install Terraform KVM provider
# The Terraform KVM provider will provision infrastructure with Linux’s KVM using libvirt.
cd ~
terraform init
cd ~/.terraform.d
mkdir plugins
curl -s https://api.github.com/repos/dmacvicar/terraform-provider-libvirt/releases/latest \
  | grep browser_download_url \
  | grep linux_amd64.zip \
  | cut -d '"' -f 4 \
  | wget -i -
unzip terraform-provider-libvirt_*_linux_amd64.zip
rm -f terraform-provider-libvirt_*_linux_amd64.zip
mkdir -p ~/.terraform.d/plugins/
mv terraform-provider-libvirt_* ~/.terraform.d/plugins/terraform-provider-libvirt
echo "terraform {
  required_providers {
    libvirt = {
      source = \"dmacvicar/libvirt\"
    }
  }
}

provider \"libvirt\" {
  # Configuration options
  uri = "qemu:///system"
  #alias = "server2"
  #uri   = "qemu+ssh://root@192.168.100.10/system"
}" >> main.tf



# Wrapup
echo "Deployment script completed. Here's what is now installed:"
cat ~/Downloads/deployerlog.txt