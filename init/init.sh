GIT_ROOT_DIR="$(git rev-parse --show-toplevel)"

source $GIT_ROOT_DIR/scripts/pull_submodules.sh

# Detect the operating system and put it into the OS variable
source $GIT_ROOT_DIR/scripts/check_os.sh

# Install ansible
source $GIT_ROOT_DIR/init/install_ansible.sh

ANSIBLE_NOCOWS=1 ansible-playbook -i localhost, --connection=local $GIT_ROOT_DIR/ansible/playbooks/development-machines.ansible.yaml --ask-become-pass
