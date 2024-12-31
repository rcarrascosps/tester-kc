## Let's install the package dependencies

First let's move into the directory where the rest client is located.

`cd ../../darkClientSample`{{execute}}

Now let's install the required node packages:

`npm i @openziti/ziti-sdk-nodejs`{{execute}}


## Set the environment variable pointing to our Identity file

The environment variable is ZITI_IDENTITY_FILE.

```
export ZITI_IDENTITY_FILE="/root/darkociapigtwy/etc/deployment/killercoda.json"
export ZITI_HOST="https://"
ZITI_HOST+=$gateway_host
```{{execute}}

Now let's check the code.

## Check the code

Open the code in the KilerCoda code editor 

TODO: open the file

And now is time to execute our NodeJS client that will consume the Dark API:

`node callMyDarkDarkService.js`{{execute}}

As you could see, we are receiving the response of the API. Ain't that cool?



