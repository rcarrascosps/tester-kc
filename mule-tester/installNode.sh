#!/bin/bash

echo "Installing cUrl..."
apt install curl -y

echo "Downloading nvm..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
source ~/.bashrc

echo "Installing Node..."
nvm install --lts
nvm alias default 20.12.0


# Validate NPM and Node versions
node -v npm -v

