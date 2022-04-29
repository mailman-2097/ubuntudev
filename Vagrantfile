# -*- mode: ruby -*-
# vi: set ft=ruby :

IP_SRVR = "192.168.76.76"


VAGRANTFILE_API_VERSION = "2"
BOX_IMAGE = "geerlingguy/ubuntu2004"
SRVR_COND = true

# VM to execute sourced an
# VM requires docker
$vm_script = <<SCRIPT
set -e
sudo apt-get update -y
source ~/.profile
SCRIPT

$dns_script = <<SCRIPT
echo "$1	ubuntuvm.local	 ubuntuvm" >> /etc/hosts 
SCRIPT

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

config.vm.define "ubuntuvm", autostart: SRVR_COND	do |ubuntuvm|
		ubuntuvm.vm.box = BOX_IMAGE
		ubuntuvm.vm.hostname = 'ubuntuvm.local'
		ubuntuvm.vm.network :private_network, ip: IP_SRVR
		ubuntuvm.vm.network :forwarded_port, guest: 22, host: 10022, id: "ssh"
    ubuntuvm.vm.synced_folder ".", "/vagrant", owner: "vagrant", group: "vagrant"
		ubuntuvm.vm.provision "shell" do |s|
			s.inline = $dns_script
			s.args = [IP_SRVR]
		end
		ubuntuvm.vm.provision "shell", inline: $vm_script

		ubuntuvm.vm.provider :virtualbox do |vb|
					vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
					vb.customize ["modifyvm", :id, "--memory", 1024]
					vb.customize ["modifyvm", :id, "--name", "ubuntuvm"]
		end
end
end