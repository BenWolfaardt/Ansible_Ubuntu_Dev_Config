# Ansbile config for my Ubuntu Dev devices

Over the years I've formatted and re-installed OSes far too many times... so when I discoverd `Ansible` it was the obvious first thing to automate in my life.

## TODOs

- Update bootstrap to have the pyenv setup - wait, we can't as pyenv is installed by Ansible
- Update my dotfiles to have the poetry config and have a branch for different OS's
- Check if things are already installed before re-running them in full
- see more details from sys0dm1n for `notify: Update apt cache`
- Browser
  - Browser extensions
- General maintenance
  - Check if Discord has a new version, then delete current version and install new version
  - VSCode update
  - A cronjob that runs sudo-update at x interval
- openssl - https://github.com/sys0dm1n/ansible-ubuntu-desktop/blob/master/roles/common/files/openssl.cnf

## Insperation

- https://github1s.com/lvancrayelynghe/ansible-ubuntu/
- https://github1s.com/sys0dm1n/ansible-ubuntu-desktop/
