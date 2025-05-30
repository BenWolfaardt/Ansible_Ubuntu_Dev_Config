#!/bin/sh
PYTHON_VERSION="3.12.8"
PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

# Check if pyenv is available
if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
else
    echo "pyenv is not installed and is required to run this script. \
        Run the bootstrap script if this is your first time running this repository ensuring you enable the pyenv role. \
        Exiting."
    exit 1
fi

if pyenv versions --bare | grep -q "$PYTHON_VERSION"; then
    echo "Python $PYTHON_VERSION to be used."
else
    echo "Python $PYTHON_VERSION is not installed. Installing..."
    pyenv install "$PYTHON_VERSION"
fi

source "$PYENV_ROOT/bin/pyenv" && pyenv shell "$PYTHON_VERSION"
export ansible_python_interpreter="$(pyenv which python)"

ansible-playbook -i "localhost," -c local main.yml --ask-become-pass -vv
exec "$SHELL"
source $HOME/.zprofile

# TODO remove the wget-log that is generated at the end of this script
