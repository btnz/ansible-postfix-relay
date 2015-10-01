#!/bin/bash

set -e

ANSIBLE_PLAYBOOK_PATH="site.yml"
ANSIBLE_INVENTORY_PATH=".vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory"

VAGRANT_SSH_USER=vagrant
VAGRANT_SSH_KEY_PATH=".vagrant/machines/kiwiburrow/vmware_fusion/private_key"

usage () {
  echo "$0 <greeting>"
  exit 1
}

run_playbook () {
      ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook \
      --inventory-file=$ANSIBLE_INVENTORY_PATH \
      --user=$VAGRANT_SSH_USER \
      --private-key=$VAGRANT_SSH_KEY_PATH \
      "$@"
}

#[ "$#" == "0" ] && usage

run_playbook "$@"
