## Create OCI Compartment where we will deploy the OCI API Gateway, Edge Router and the rest of the infra

With the OCI CLI ready to execute commands to our tenant, we can proceed to create the compartment:

`export darkCompartmentId=$(oci iam compartment create --name "darkCompartment" --compartment-id $TENANCY_OCID --description "my compartment" | jq -r .data.id)`{{execute}}

We've created a compartment with the name **darkCompartment** which will contain all the elements that we will create in the following order:

* VCN
* OCI API Gateway
* NetFoundry Edge Router

## Create VCN and Private Subnet 

We'll create the network resources using Terraform, all the resources: VCN, Subnet, Security Lists, NAT Gateway, Route Tables, etc, will be created with it.
Let's first clone the repository of the Terraform Plans:

`git clone`{{execute}}

Let's set the required variables to execute our terraform plan:

```
export TF_VAR_compartment_ocid=$darkCompartmentId
export TF_VAR_vcn_name=demoDarkVCN
```

Now let's apply the plan (it will take around 30 seconds to be executed):

```
cd <Directory>

terraform init -upgrade
terraform apply -auto-approve

```{{execute}}

Now that we've created the VCN and the subnet, let's set some environment variables:

```
vcns=$(oci network vcn list  --compartment-id $TF_VAR_compartment_ocid --all)
export vcnId=$(echo $vcns | jq -r --arg display_name "demoDarkVCN" '.data | map(select(."display-name" == $display_name)) | .[0] | .id')
echo $vcnId
subnets=$(oci network subnet list  -c $TF_VAR_compartment_ocid --vcn-id $vcnId)
export TF_VAR_subnet_ocid=$(echo $subnets | jq -r --arg display_name "private subnet-demoDarkVCN" '.data | map(select(."display-name" == $display_name)) | .[0] | .id')
echo $TF_VAR_subnet_ocid
```{{execute}}


What we have created is a fully private VCN with one subnet. The only communication that this subnet could receive is from within its own CIDR block. Which is exactly what we need. On top of it we will deploy the OCI API Gateway and make it Dark. 

In the next steps you'll create all the NetFoundry resources.
