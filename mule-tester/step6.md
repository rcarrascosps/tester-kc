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

The MuleSoft API Catalog discovered the API specs that were in that directory and with that it generated the descriptor file.

### Let's edit the descriptor file

Copy the following text:

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

```

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

![Exchange](https://raw.githubusercontent.com/rcarrascosps/tester-kc/main/mule-tester/assets/exchange2.jpg?raw=true)


