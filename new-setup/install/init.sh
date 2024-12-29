INSTALL_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
SCRIPTS_DIR=$INSTALL_DIR/../scripts

source $SCRIPTS_DIR/pull_submodules.sh

# Detect the operating system and put it into the OS variable
source $SCRIPTS_DIR/check_os.sh

# Install ansible
source $INSTALL_DIR/install_ansible.sh

ANSIBLE_NOCOWS=1 ansible-playbook -i localhost, --connection=local $INSTALL_DIR/ansible/playbooks/init.ansible.yaml --ask-become-pass
