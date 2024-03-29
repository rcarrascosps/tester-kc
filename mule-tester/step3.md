
### Create the Connected Apps
We need to create a connected app that allow us to connect and authenticate to Anypoint Platform in order to allow the API Catalog CLI to push assets to Exchange and also 
read information of your environment.

Open the Anypoint Platform console and head into the Access Management menu option:

![Access Management](/mule-tester/connApps.jpg)

Then, click on the button labed as "Create App":

![Create App Button](/rcarrascosps/tester-kc/mule-tester/createApp.jpg)

You will be taken to the following screen, give a name to your connected app and select the option shown in the following screen:

![Create App Button](/rcarrascosps/tester-kc/mule-tester/createApp2.jpg)

Then, click on the Add Scopes button:

![Add Scopes](/rcarrascosps/tester-kc/mule-tester/createApp3.jpg)

Now we will select just the required scopes to allow the MuleSoft API Catalog CLI to interact with Exchange and to read information about your environment.
The first scope is the following. Please select it:

![Select Scopes](/rcarrascosps/tester-kc/mule-tester/addScopes.jpg)

Then scroll down until you find the General section:

![General Scopes](/rcarrascosps/tester-kc/mule-tester/addScopes2.jpg)

And finally, select the View Environment Scope, like this:

![View Environment Scope](/rcarrascosps/tester-kc/mule-tester/addScopes3.jpg)

Finally, click on the Next Button:

![View Environment Scope](/rcarrascosps/tester-kc/mule-tester/addScopes4.jpg)

Then select the Business Group (BG) that you want to connect to. In this example is *SP Solutions*. But in your case it should be other. And then click the next button:

![Business Group](/rcarrascosps/tester-kc/mule-tester/bg.jpg)

In the next screen select the environment, in this case is *tester* but select the one where you want to work in your tenant, and click the Next Button:

![Business Group](/rcarrascosps/tester-kc/mule-tester/bg2.jpg)

The next step is a summary of the configuration of the connected app, just click on the *Add Scopes* button:

![Business Group](/rcarrascosps/tester-kc/mule-tester/bg3.jpg)

Then you will be taken here, just click on the *Save* button:

![Create App Button](/rcarrascosps/tester-kc/mule-tester/createApp4.jpg)

You will get back to the connected apps screen where you will see listed the newly create app:




`cd 'api-catalog-cli/Follow Tutorial'`{{exec}}

