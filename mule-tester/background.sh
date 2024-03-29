#!/bin/bash

# Update and Upgrade packages
echo "Updating the system"
apt update -y
echo "Upgrading the system"
apt upgrade -y
apt install curl -y
