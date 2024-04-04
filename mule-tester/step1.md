
### Install cURL, jq, Node and NPM
Click on the next box and wait for the script to be executed. After it gets executed Node and NPM will be installed.

```

apt install curl -y
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
source ~/.bashrc
nvm install --lts
nvm alias default 20.12.0
echo "Done."
```{{exec}}

### Install jq

We need jq for some expressions we will use to **parse the JSON responses** of some of the APIs that are needed to setup our environment.

`apt install jq -y`{{exec}}

### Validate Node and NPM

Simply click the next box.

`node -v npm -v`{{exec}}

### Install MuleSoft API Catalog CLI

MuleSoft API Catalog CLI is a NodeJS based program. **To install it simply click the next box, it will take some minutes to download it and install it. Just please be patient.**
Please ignore the warnings after the CLI installation.

`npm install -g api-catalog-cli@latest`{{exec}}

**!!! Do not proceed until the MuleSoft API Catalog CLI gets installed. !!!**

### Validate API Catalog CLI

Once the API Catalog CLI was installed we can proceed with the following steps.

To validate the MuleSoft API CLI installation, simply click the next box. It should return the different command options of the CLI:

`api-catalog`{{exec}}

We are ready to start learning how to use the MuleSoft API Catalog CLI.

**Let's go to the next step!!**