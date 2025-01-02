# Summary

At this poing you have deployed:
- A fully private VCN and Subnet in Oracle Cloud
- A Oracle Cloud Infrastructure API Gateway using the private VCN. And also an API serving on it.
- A NetFoundry.io Edge Router running in the private subnet
- All the elements in NetFoundry (Identity, Service, Policy)
- A NodeJS client to consume the API deployed on the OCI API Gateway

If you go to the NetFoundry console and to the Identities section, click on the KillerCoda contextual menu and then click on Visualize, you will see something like this:

![](https://raw.githubusercontent.com/rcarrascosps/tester-kc/main/dark-oci-api-gateway/assets/network.gif?raw=true)

You may proceed to destroy all the assets that were provisioned in your tenancy.

Thank you and hopefully you've enjoyed executing the scenario.