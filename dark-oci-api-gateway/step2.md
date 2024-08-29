### Install cURL, jq, Node and NPM
Click on the next box and wacURL it for the script to be executed. After it gets executed Node and NPM will be installed.

cURL installation:

```
apt install curl -y
```{{exec}}

NPM and Node installation:

```
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
source ~/.bashrc
nvm install --lts
nvm alias default 20.17.0
echo "Done."
```{{exec}}

### Install jq

We need jq for some expressions we will use to **parse the JSON responses** of some of the APIs that are needed to setup our environment.

`apt install jq -y`{{exec}}

### Validate Node and NPM

Simply click the next box.

`node -v npm -v`{{exec}}

### Install Terraform CLI

Download Terraform Installer from GitHub https://github.com/robertpeteuil/terraform-installer
`git clone https://github.com/robertpeteuil/terraform-installer`{{execute}}

Execute the Terraform installer to install Terraform
`./terraform-installer/terraform-install.sh`{{execute}}

Test that Terraform was properly installed

`terraform version`{{execute}}

### PIP update

Let's update pip:

`/root/lib/oracle-cli/bin/python -m pip install --upgrade pip`{{execute}}
