## Let's create the credentials in NetFoundry to managed resources using their APIs

Go to your NetFoundry console, and head to the Organization section (right side of the window):

![](https://raw.githubusercontent.com/rcarrascosps/tester-kc/main/dark-oci-api-gateway/assets/netorg.png?raw=true)

Then click on the API Accounts:

![](https://raw.githubusercontent.com/rcarrascosps/tester-kc/main/dark-oci-api-gateway/assets/netAPIAcc.png?raw=true)

Finally click on the blue cross button:

![](https://raw.githubusercontent.com/rcarrascosps/tester-kc/main/dark-oci-api-gateway/assets/netCreateAPI.png?raw=true)

Fill the blanks with the following info:

![](https://raw.githubusercontent.com/rcarrascosps/tester-kc/main/dark-oci-api-gateway/assets/netCreateAPI2.png?raw=true)

Once created, copy the respective values (use the respective blue buttons to copy the different values):

![](https://raw.githubusercontent.com/rcarrascosps/tester-kc/main/dark-oci-api-gateway/assets/netCopyValues2.png?raw=true)

Copy the client_ID, and paste it in the next step:

```
echo "Please enter the client_id from the Copy Id button: "
read clientId 
```{{exec}}

Copy the client_secret, and paste it in the next step:

```
echo "Please enter the client_secret from the Copy Secret button: "
read clientSecret 
```{{exec}}

Copy the URL, and paste it in the next step:

```
echo "Please enter the URL from the Copy URL: "
read nfOAuthURL 
```{{exec}}

Then click on the "OK, ALL SET" button:

![](https://raw.githubusercontent.com/rcarrascosps/tester-kc/main/dark-oci-api-gateway/assets/okAllSet.png?raw=true)

Then let's assign roles to our API account. Click on the three dots:

![](https://raw.githubusercontent.com/rcarrascosps/tester-kc/main/dark-oci-api-gateway/assets/netCreateAPI4.png?raw=true)


Then assign the following roles:

![](https://raw.githubusercontent.com/rcarrascosps/tester-kc/main/dark-oci-api-gateway/assets/assignRoles.png?raw=true)


## Let's create the Edge Router in NetFoundry

First we need to set some variables:

```
export nfCredentials=$(echo -n $clientId":"$clientSecret)
export nfSvc="ociAPIGtwySvc"
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

