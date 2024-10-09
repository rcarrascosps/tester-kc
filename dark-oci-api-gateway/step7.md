## Create an OCI API Gateway

We are going to create the OCI API Gateway using the OCI CLI.

`cd Directory`{{execute}}

First we need to set some variables:

```
export endpoint_type=PRIVATE
export subnet_id=ocid1.subnet.oc1.iad.aaaaaaaa36o2m3lrtwyw4vtyg6ky43wnwuuobnvskpo7dqnolk3gyn4fn5pa
export display_name=darkGtwy
```{{execute}}

With the required variables we can proceed to create the OCI API Gateway:

`oci api-gateway gateway create --compartment-id $compartment_id --endpoint-type $endpoint_type --subnet-id $subnet_id --display-name $display_name`{{execute}}


## Create a deployment

Now with the OCI API Gateway created we can proceed to generate a deployment that includes the API that we want to publish.

We need first to set some environment variables:

```
export compartment_id=ocid1.compartment.oc1..aaaaaaaanm4vbhohvgtv4dlp6peonspve3xalvqtadubivwdrwstsf7zanwa
export endpoint_type=PRIVATE
export subnet_id=ocid1.subnet.oc1.iad.aaaaaaaa36o2m3lrtwyw4vtyg6ky43wnwuuobnvskpo7dqnolk3gyn4fn5pa
export path_prefix="/api"
gateway_id=$(oci api-gateway gateway create --compartment-id $compartment_id --endpoint-type $endpoint_type --subnet-id $subnet_id --query data.id --raw-output)
```{{execute}}

And now we can create the deployment:

`oci api-gateway deployment create --compartment-id $compartment_id --gateway-id $gateway_id --path-prefix $path_prefix --specification file://specification.json`{{execute}}

While the deploymet is getting created (it may take about a minute) let's take a look to the specification.json file we used to create it:

```
{
  "routes": [
    {
      "path": "/stock",
      "methods": ["GET"],
      "backend": {
        "type": "STOCK_RESPONSE_BACKEND",
        "body": "{\"message\":\"Response from a Dark Gateway\"}",
        "headers":[],
        "status":200
      }
    }
  ]
}
```

We are telling to the API Gateway to create a deployment that includes resources by the name **/stock** that will respond to the GET command and that it will return
a fixed message like this:

```
{
	"message": "Response from a Dark Gateway"
}
```

That API resource will be serving at: https://gatewayHostname/api/stock

From this killercoda terminal we cannot access it, since the API Gateway is completely private.

In the next step you will learn how to create a Service, and Identity and an AppWAN in NetFoundry. That is needed to create the Dark API and then we will
be in position to consume the service within the Killercoda terminal.

