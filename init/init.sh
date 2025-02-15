BATON_ROOT_DIR="$(git rev-parse --show-toplevel)"

source $BATON_ROOT_DIR/scripts/pull_submodules

# Detect the operating system and put it into the OS variable
source $BATON_ROOT_DIR/scripts/check_os

# Install ansible
source $BATON_ROOT_DIR/init/install_ansible.sh

# ANSIBLE_NOCOWS=1 ANSIBLE_ROLES_PATH="$BATON_ROOT_DIR/ansible/roles" ansible-playbook -i "$BATON_ROOT_DIR/ansible/inventory.yaml" "$PLAYBOOK_PATH" --ask-become-pass

# ANSIBLE_NOCOWS=1 ANSIBLE_ROLES_PATH="$BATON_ROOT_DIR/ansible/roles" ansible-playbook -i "$BATON_ROOT_DIR/ansible/inventory.yaml", --connection=local "$BATON_ROOT_DIR/ansible/playbooks/development-machines.ansible.yaml" --ask-become-pass

source $BATON_ROOT_DIR/ansible/run_playbook "$BATON_ROOT_DIR/ansible/playbooks/development-machines.ansible.yaml"
