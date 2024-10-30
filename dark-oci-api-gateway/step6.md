## Move to the directory that holds the Terraform plan to deploy the Edge Router

`cd ../darkER`{{execute}}

We need to copy the public key to the user directory. 

`cp ../etc/keys/id_rsa.pub ~/.ssh/`{{execute}}


## Let's deploy an Edge Router in OCI

First we need to set the user data that needs the compute instance to start the Edge Router:

```
H='#!/bin/bash'; C="sudo /opt/netfoundry/router-registration "; userdata="${H}"$'\n'"${C}""${edgeRouterRegKey}"; echo "${userdata}"
TF_VAR_user_preferences=$(echo -n $userdata | base64 -w0)
echo $TF_VAR_user_preferences
```{{execute}}


Now with the required variables, let's deploy the Edge Router.

```
terraform init -upgrade
terraform apply -auto-approve
```{{execute}}

Wait about 60 seconds and go to the NetFoundry web console and into the Edge Router section to check that the Edge Router has reported to the control plane.
You should see a green circle beside the name of the Edge Router, look at the following image

![](https://raw.githubusercontent.com/rcarrascosps/tester-kc/main/dark-oci-api-gateway/assets/nfERStatus.png?raw=true)

Now with the Edge Router deployed, we can proceed to create the OCI API Gateway, and an API on our private subnet.











