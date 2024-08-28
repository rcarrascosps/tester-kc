This scenario will guide you in deploying a Dark OCI API Gateway in very few steps using OpenZitio.io.
The scenario not only that will deploy the whole infrastructure to make this happen, but will also provide a Node.js rest client to consume a Dark API.

It considers to deploy an OCI API Gateway completely private (OCI private subnet) with no open ports for inbound traffic, but still from the Node.js client running
in the killercoda terminal, you'll be able to call the rest API deployed on OCI API Gateway.

The assumption is that you are the administrator of the tenancy - either a fresh or preexisting cloud trial or a "regular" OCI tenancy.

Note: step 1 provides some hints for getting a free trial on Oracle Cloud Infrastructure in case you do not yet have a tenancy. If you do have access to an OCI instance, then you skip step 1 and go to step 2. 

The fully prepared handson environment will live in a single compartment called *dark-compartment*. This compartment contains:
* an OCI API Gateway
* a VCN with a private subnet (with all its elements: Security Lists, Route Tables, etc)
* a Compute Instance running an Edge Router from NetFoundry


It is assumed that you do the handson scenarios as an administrator for the tenancy. This means that you do not need to create a user, groups nor policies.  

![](https://raw.githubusercontent.com/rcarrascosps/tester-kc/main/dark-oci-api-gateway/assets/intro.png?raw=true)

