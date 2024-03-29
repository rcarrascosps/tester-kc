
### Install Node and NPM
```
apt install curl -y
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
source ~/.bashrc
nvm install --lts
nvm alias default 20.12.0
```

### Validate Node and NPM
`node -v npm -v`

### Test the connected App
`ls -lh`{{exec}}

### Execute multiline code block

```
uname -r
pwd
```{{exec}}