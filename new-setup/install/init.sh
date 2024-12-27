INSTALL_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
SCRIPTS_DIR=$INSTALL_DIR/../scripts

# Detect the operating system and put it into the OS variable
source $SCRIPTS_DIR/check_os.sh

# Install ansible
source $INSTALL_DIR/install_ansible.sh


ansible-playbook -i localhost, --connection=local $INSTALL_DIR/playbooks/install_neovim.yml --ask-become-pass