#! /bin/bash -e
pushd /vagrant
ansible-playbook -v provisioning/playbook.yml
popd