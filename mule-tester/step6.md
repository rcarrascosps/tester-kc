### Let's generate a descriptor file

MuleSoft API Catalog CLI needs a descriptor file that gets generated with the following commnad:

`api-catalog create-descriptor`{{exec}}

In the project directory, you will see now a file named catalog.yaml. You can choose different name for your descriptor file using the -d <file name> flag

You can see the descriptor file in the Killercoda editor tab, click on the tab and look for the file at the directory: /root/api-catalog-cli/Follow Tutorial

![Editor](https://raw.githubusercontent.com/rcarrascosps/tester-kc/main/mule-tester/assets/editor.jpg?raw=true)

You will see something like this:

```
#%Catalog Descriptor 1.0
projects:
  - main: payments-oas.yaml
    assetId: invoice-payment-system-api
    version: 1.1.0
    apiVersion: v1
  - main: shipping/shipping-api.yaml
    assetId: shipping-api
    version: 1.0.0
    apiVersion: v1

```

As you can see the MuleSoft API Catalog CLI **discovered** what is in the directories which is the following:

```
drwxr-xr-x 4 root root  4096 Apr  4 22:28 .
drwxr-xr-x 6 root root  4096 Apr  4 22:28 ..
drwxr-xr-x 3 root root  4096 Apr  4 22:28 .github
-rw-r--r-- 1 root root 35753 Apr  4 22:28 payments-oas.yaml
drwxr-xr-x 2 root root  4096 Apr  4 22:28 shipping
```

The directory has one API spec (*OAS*) for the Payments API and then a second one inside the shipping directory:

```
drwxr-xr-x 2 root root 4096 Apr  4 22:28 .
drwxr-xr-x 4 root root 4096 Apr  4 22:28 ..
-rw-r--r-- 1 root root 1538 Apr  4 22:28 home.md
-rw-r--r-- 1 root root 1561 Apr  4 22:28 shipping-api.yaml
```

The shipping directory contains the Shipping API spec and a markdown file with some information of it. The MuleSoft API Catalog CLI was able to detect all those elements.
And with that, the CLI generated the descriptor file (**catalog.yaml**).


### Let's edit the descriptor file

Copy the following text by simply clicking on the next box:

```
#%Catalog Descriptor 1.0
projects:
  - main: payments-oas.yaml
    assetId: invoice-payment-system-api
    version: 1.1.0
    apiVersion: v1
  - main: shipping/shipping-api.yaml
    assetId: shipping-api
    version: 1.0.1
    apiVersion: v1
    contact:
      name: 'Jane Doe'
      email: 'fake.email@org.com'
    tags:
      - logistics
      - commerce
    documentation:
      Home: shipping/home.md

```{{copy}}

Get back to the Editor Tab and replace the contents of the catalog.yaml file.

Now is time to push our API Specs to MuleSoft Anypoint Exchange.

### Publish to MuleSoft Exchange

Get back to the **Tab1** and execute the following command:

`api-catalog publish-asset --host=anypoint.mulesoft.com -d catalog.yaml --organization=$orgId --bearer=$accessToken --dry-run --verbose >> mycatdryrun.log`{{exec}}

That was a dry-run command and the out out is at the file **mycatdryrun.log**. Let's see its contents:

`more mycatdryrun.log`{{exec}}

Now let's perform the publishing of the API discovered by the API Catalog CLI into Exchange:

`api-catalog publish-asset --host=anypoint.mulesoft.com -d catalog.yaml --organization=$orgId --bearer=$accessToken --verbose`{{exec}}

You should see an output like this:

![API Catalog CLI](https://raw.githubusercontent.com/rcarrascosps/tester-kc/main/mule-tester/assets/apicatalogExec.jpg?raw=true)

Now, let's head into MuleSoft Anypoint Exchange and look for an API by the name: Shipping API. Which is one of the APIs discovered by the API Catalog CLI:

![Exchange](https://raw.githubusercontent.com/rcarrascosps/tester-kc/main/mule-tester/assets/exchange1.jpg?raw=true)

Click on it:

![Exchange](https://raw.githubusercontent.com/rcarrascosps/tester-kc/main/mule-tester/assets/exchange3.jpg?raw=true)


