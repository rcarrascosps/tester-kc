## Let's install the package dependencies

First let's move into the directory where the rest client is located.

`cd ../../darkClientSample`{{execute}}

Now let's install the required node packages:

`npm i @openziti/ziti-sdk-nodejs`{{execute}}


## Set the environment variable pointing to our Identity file

The environment variable is ZITI_IDENTITY_FILE.

```
export ZITI_IDENTITY_FILE="/root/darkociapigtwy/etc/sw/killercoda.json"
export ZITI_HOST="https://"
ZITI_HOST+=$gateway_host
mv package.json.bak package.json
```{{execute}}

Now let's check the code.


## Check the code

Open the code in the KilerCoda code editor 

`more callMyDarkService.js`{{execute}}

As you can see is a very simple call to a REST Service.

Now is time to execute our NodeJS client that will consume the Dark API:

`node callMyDarkService.js`{{execute}}

As you could see, we are receiving the response of the API. Ain't that cool?

You should see something like this:

![](https://raw.githubusercontent.com/rcarrascosps/tester-kc/main/dark-oci-api-gateway/assets/callingDarkService.png?raw=true)

If you try to ping the hostname of the OCI API Gateway, you will see that the KillerCoda terminal is not going to reach it. Try a telnet, a cURL, or any other option to try to connect to it, but it will be impossible. Just our piece of NodeJS code through the OpenZiti.io SDK is able to connect to it. Is like magic.

At this poing you have deployed:
- A fully private VCN and Subnet in Oracle Cloud
- A Oracle Cloud Infrastructure API Gateway using the private VCN. And also an API serving on it.
- A NetFoundry.io Edge Router running in the private subnet
- All the elements in NetFoundry (Identity, Service, Policy)
- A NodeJS client to consume the API deployed on the OCI API Gateway

If you go to the NetFoundry console and to the Identities section, click on the KillerCoda contextual menu and then click on Visualize, you will see something like this:

![](https://raw.githubusercontent.com/rcarrascosps/tester-kc/main/dark-oci-api-gateway/assets/network.gif?raw=true)
