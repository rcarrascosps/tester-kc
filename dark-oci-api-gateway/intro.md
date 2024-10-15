This scenario will guide you on deploying a Dark OCI API Gateway in very few steps using OpenZitio.io.
The scenario not only that will deploy the whole infrastructure to make this happen, but will also provide a Node.js REST client to consume a Dark API.

It considers to deploy an OCI API Gateway completely private (OCI private subnet) with no open ports for inbound traffic, but still from a Node.js client running in the killercoda terminal, you'll be able to call/connect the REST API deployed on OCI API Gateway.

![](https://raw.githubusercontent.com/rcarrascosps/tester-kc/main/dark-oci-api-gateway/assets/intro.png?raw=true)

The assumption is that you are the administrator of the tenancy - either a fresh or preexisting cloud trial or a "regular" OCI tenancy.

Note: step 3 provides some hints for getting a free trial on Oracle Cloud Infrastructure in case you do not yet have a tenancy.

The fully prepared handson environment will live in a single compartment called *darkCompartment*. This compartment will contain:

* an OCI API Gateway
* a VCN with a private subnet (with all its elements: Security Lists, Route Tables, etc)
* a Compute Instance running an Edge Router from NetFoundry


It is assumed that you do the scenario as an administrator for the tenancy. This means that you do not need to create a user, groups nor policies. 

Now we're ready to execute the scenario!

**Do not proceed until you see the next information at the right window:**

![](https://raw.githubusercontent.com/rcarrascosps/tester-kc/main/dark-oci-api-gateway/assets/doNotProceed.png?raw=true)


