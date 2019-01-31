#!/bin/bash
set -x
set -e

echo "Installing XCode CLI tools"

( xcode-select -p )
if [[ $? -eq 2 ]]; then
    xcode-select --install 
fi

# Check to see if Homebrew is installed, and install it if it is not
command -v brew >/dev/null 2>&1 || { echo >&2 "Installing Homebrew Now"; \
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"; }

command -v ansible >/dev/null 2>&1 || { echo >&2 "Installing Ansible Now"; \
brew install ansible; }

echo "Calling developer playbook..."
echo "please provide you're root password and then you can go to lunch"
ansible-playbook localhost.yml
