#! /bin/bash -e
apt-get install software-properties-common
add-apt-repository --yes --update ppa:ansible/ansible
apt-get install ansible -y
ansible-galaxy collection install community.general