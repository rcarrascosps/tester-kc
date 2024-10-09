## Let's create the credentials in NetFoundry to managed resources using their APIs

TODO

## Let's create the Edge Router in NetFoundry

First we need to set some variables:

```
export nfOAuthURL="https://netfoundry-production-xfjiye.auth.us-east-1.amazoncognito.com/oauth2/token"
export nfCredentials="NXQaTFyY24wczRrZWc2Z2tqNWtrcTM6Y240NWtmZm9lcXIxMjJzcGJ1amx1NnJ"

export nfNetworkID=""
export nfSvc="ociAPIGtwySvc"

export clientIngressHost="mdsv5rqni2atlcnytbltwcyezm.apigateway.us-ashburn-1.oci.customer-oci.com"
export clientIngressPort=443
export clientEgressHost="mdsv5rqni2atlcnytbltwcyezm.apigateway.us-ashburn-1.oci.customer-oci.com"
export clientEgressPort=443

export nfIdentityName="killerCoda"
```{{execute}}

Now with the required variables, let's create the Edge Router.

The first step is to get an access token from NetFoundry to call its APIs.

```
access_tokenNF=$(curl --silent -X POST ${nfOAuthURL} --header "Authorization: Basic ${nfCredentials}" --header 'content-type: application/x-www-form-urlencoded' --data 'grant_type=client_credentials&scope=https%3A%2F%2Fgateway.production.netfoundry.io%2F%2Fignore-scope' | jq -r '.access_token')
echo $access_tokenNF
```{{execute}}

## Get the Network ID

Now let's get the ID of our Dark Network that we deployed earlier on NetFoundry:

```
nfNetworkID=$(curl --silent https://gateway.production.netfoundry.io/core/v2/networks --header "Authorization: Bearer ${access_tokenNF}" | jq  -r '._embedded.networkList[]|.id')
echo $nfNetworkID
```{{execute}}

Now with the Network ID we can proceed to create the Edger Router.


## Create the Edge Router

```
edgeRouterID=$(curl --silent -X POST https://gateway.production.netfoundry.io/core/v2/edge-routers --header "Content-Type: application/json" --header "Authorization: Bearer ${access_tokenNF}" -d'{"networkId": "'${nfNetworkID}'","attributes": ["#defaultRouters"],"name": "exampleEdgeRouter","linkListener": true}' | jq  -r .id)
echo $edgeRouterID
sleep 3
```{{execute}}

The Edge Router is created and we need to retreive the registration key that we will use to deploy it phisically on OCI inside the VCN that have already created.

## Get Registration Key


```
edgeRouterRegKey=$(curl --silent -X POST https://gateway.production.netfoundry.io/core/v2/edge-routers/${edgeRouterID}/registration-key --header "Authorization: Bearer ${access_tokenNF}" | jq -r .registrationKey)
echo $edgeRouterRegKey
```{{execute}}

With the registration key, we can move to the next step which is to deploy the Edge Router on OCI.

