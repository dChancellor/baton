BATON_ROOT_DIR="$(git rev-parse --show-toplevel)"

source $BATON_ROOT_DIR/scripts/pull_submodules

# Detect the operating system and put it into the OS variable
source $BATON_ROOT_DIR/scripts/check_os

# Install ansible
source $BATON_ROOT_DIR/init/install_ansible.sh

# Runs local ansible playbook to install all the necessary dependencies for development
source $BATON_ROOT_DIR/ansible/run_playbook "$BATON_ROOT_DIR/ansible/playbooks/development-machines.ansible.yaml"
