#!/bin/sh
sudo apt update && sudo apt dist-upgrade -y

sudo apt-get install software-properties-common -y
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt install ansible -y

sudo apt autoremove -y  # may potentially break things

ansible-galaxy install -r requirements.yml
ansible-playbook -i "localhost," -c local main.yml --ask-become-pass -v
