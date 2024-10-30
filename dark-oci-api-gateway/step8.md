## Create a Service in NetFoundry that represents the API in the OCI API gateway

First we need to set some variables:

```
export nfSvc=ociAPIGtwySvc
export clientIngressHost=$gateway_host
export clientIngressPort=443
export clientEgressHost=$gateway_host
export clientEgressPort=443
export nfIdentityName=killerCoda
```{{execute}}

Now with the required variables, let's create the Service.

```
nfServiceID=$(curl --silent -X POST https://gateway.production.netfoundry.io/core/v2/services --header "Authorization: Bearer ${access_tokenNF}" --header "Content-Type: application/json" -d '{"networkId":"'${nfNetworkID}'", "name":"'${nfSvc}'", "encryptionRequired":true, "modelType":"TunnelerToEndpoint", "model":{ "serverEggress":{"protocol": "tcp","host":"'${clientEgressHost}'", "port":"${clientEgressPort}"},"clientIngress":{ "host":"'${clientIngressHost}'", "port":"${clientIngressPort}"},      "edgeRouterAttributes":[], "bindEndpoints":[], "bindEndpointAttributes":["@exampleEdgeRouter"]}}' | jq  -r .id)

echo $nfServiceID
```{{execute}}

The service is pointing to the hostname and port of our private API Gateway. In this case we are keeping the same in NetFoundry, but we could change it to whatever we want.

Now with the service created we will generate the Identity. The Identity will be used here in the KillerCoda terminal through the NodeJS NetFoundry SDK to consume the dark service.

## Create an Identity in netfoundry


```
nfIdentityID=$(curl --silent -X POST https://gateway.production.netfoundry.io/core/v2/endpoints --header "Authorization: Bearer ${access_tokenNF}" --header "Content-Type: application/json" -d '{"attributes": [],"networkId":"'${nfNetworkID}'","enrollmentMethod": {"ott": true},"name": "'${nfIdentityName}'","selected": false}' | jq -r '.id')
echo $nfIdentityID
```{{execute}}

The Identity is in JWT format, and we need to retrieve it with the following command

`curl -X GET https://gateway.production.netfoundry.io/core/v2/endpoints/${nfIdentityID} --header "Authorization: Bearer ${access_tokenNF}" | jq -r '.jwt' > killercoda.jwt`{{execute}}

You can check it with:

`more killercoda.jwt`{{execute}}

Now we'll enroll our identity with the following command:

```
cp killercoda.jwt ../sw
cd ../sw
unzip ziti.zip
chmod 755 ziti
./ziti edge enroll --jwt killercoda.jwt --out killercoda.json
```{{execute}}

The SDK is going to use the json file generated in the previous step.

## Create AppWAN

Now is time to create an AppWAN. With it we are generating a relationship between the Service and the Identity. As a result, the identity now has access to the Service.

`curl -X POST https://gateway.production.netfoundry.io/core/v2/app-wans/ --header "Authorization: Bearer ${access_tokenNF}" --header 'Content-Type: application/json' --data '{"selected":false,"endpointAttributes":["@killerCoda"],"serviceAttributes":["@ociAPIGtwySvc"],"postureCheckAttributes":[],"networkId":"'${nfNetworkID}'","name":"myPolicy"}'`{{execute}}

In the next step we will run a NodeJS based REST client to consume our Dark API.



