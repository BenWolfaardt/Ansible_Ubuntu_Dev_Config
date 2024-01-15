#!/bin/bash

# Setup pyenv environment
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

# Set PYENV_VERSION to the desired version
export PYENV_VERSION="3.12.1"

# Check if the correct version of Python is being used
if [ "$(python --version 2>&1)" != "Python 3.12.1" ]; then
  echo "Incorrect Python version. Expected Python 3.12.1."
  exit 1
fi

# Check if 'pyenv which python' points to the correct version
if [ "$(pyenv which python)" != "$HOME/.pyenv/versions/3.12.1/bin/python" ]; then
  echo "pyenv is not pointing to the correct Python version."
  exit 1
fi

# Initialize Poetry and set Python environment
poetry init --no-interaction
poetry env use $(pyenv which python)

# Activate the poetry environment
cd roles/docker/files/
poetry shell
poetry install --no-root

VENV_PYTHON=$(poetry env info -p)/bin/python

# Run the Python script using the virtual environment's Python interpreter
docker_deb_link=$($VENV_PYTHON get_docker_deb_link.py)

chmod +x get_docker_deb_link.py

# Check if docker_deb_link is valid
if [[ ! $docker_deb_link =~ ^https?:// ]]; then
  echo "Invalid Docker DEB download link."
  exit 1
fi

# Download Docker DEB package
curl -o "/tmp/docker.deb" "$docker_deb_link"
