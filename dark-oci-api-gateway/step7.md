## Create an OCI API Gateway

Let's move to the working directory for the OCI API Gateway:

`cd ../etc/deployment`{{execite}}

We are going to create the OCI API Gateway using the OCI CLI.

First we need to set some variables:

```
export endpoint_type=PRIVATE
export subnet_id=$TF_VAR_subnet_ocid
export display_name=darkGtwy
```{{execute}}

With the required variables we can proceed to create the OCI API Gateway:

```
gateway_id=$(oci api-gateway gateway create --compartment-id $darkCompartmentId --endpoint-type $endpoint_type --subnet-id $subnet_id --query data.id --raw-output)
```{{execute}}

## Create a deployment

Now with the OCI API Gateway created we can proceed to generate a deployment that includes the API that we want to publish.

We need first to set some environment variables:

```
export endpoint_type=PRIVATE
export path_prefix="/api"
```{{execute}}

And now we can create the deployment:

`oci api-gateway deployment create --compartment-id $darkCompartmentId --gateway-id $gateway_id --path-prefix $path_prefix --specification file://specification.json`{{execute}}

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
Now let's get the hostname where the OCI API Gateway will be serving requests:

```
gateway_host=$(oci api-gateway gateway get --gateway-id $gateway_id --query data.hostname --raw-output)
echo $gateway_host
```{{execute}}

That API resource will be serving at: https://$gateway_host/api/stock

From this Killercoda terminal we cannot access it, since the API Gateway is completely private. Try it out:

`curl -X GT https://$gateway_host/api/stock`{{execute}}

As you can see we cannot access it.

In the next step you will learn how to create a Service, and Identity and an AppWAN in NetFoundry. That is needed to create the Dark API and then we will
be in position to consume the service within the Killercoda terminal.

