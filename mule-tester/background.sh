#!/bin/bash

# Update and Upgrade packages
apt update -y
apt upgrade -y
apt install curl -y
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
source ~/.bashrc
nvm install --lts
nvm alias default 20.12.0


# Validate NPM and Node versions
node -v npm -v

touch /root/allSetInBackground



