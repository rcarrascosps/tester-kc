
### Create the Connected Apps
We need to create a connected app that allow us to connect and authenticate to Anypoint Platform in order to allow the API Catalog CLI to push assets to Exchange and also 
read information of your environment.

Open the Anypoint Platform console and head into the Access Management menu option:

![Access Management](https://raw.githubusercontent.com/rcarrascosps/tester-kc/main/mule-tester/assets/connApps.jpg?raw=true)

Then, click on the button labed as "Create App":

![Create App Button](https://raw.githubusercontent.com/rcarrascosps/tester-kc/main/mule-tester/assets/createApp.jpg?raw=true)

You will be taken to the following screen, give a name to your connected app and select the option shown in the following screen:

![Create App Button](https://raw.githubusercontent.com/rcarrascosps/tester-kc/main/mule-tester/assets/createApp2.jpg?raw=true)

Then, click on the Add Scopes button:

![Add Scopes](https://raw.githubusercontent.com/rcarrascosps/tester-kc/main/mule-tester/assets//rcarrascosps/tester-kc/mule-tester/createApp3.jpg?raw=true)

Now we will select just the required scopes to allow the MuleSoft API Catalog CLI to interact with Exchange and to read information about your environment.
The first scope is the following. Please select it:

![Select Scopes](https://raw.githubusercontent.com/rcarrascosps/tester-kc/main/mule-tester/assets/addScopes.jpg?raw=true)

Then scroll down until you find the General section:

![General Scopes](https://raw.githubusercontent.com/rcarrascosps/tester-kc/main/mule-tester/assets/addScopes2.jpg?raw=true)

And finally, select the View Environment Scope, like this:

![View Environment Scope](https://raw.githubusercontent.com/rcarrascosps/tester-kc/main/mule-tester/assets/addScopes3.jpg?raw=true)

Finally, click on the Next Button:

![View Environment Scope](https://raw.githubusercontent.com/rcarrascosps/tester-kc/main/mule-tester/assets/addScopes4.jpg=raw=true)

Then select the Business Group (BG) that you want to connect to. In this example is *SP Solutions*. But in your case it should be other. And then click the next button:

![Business Group](https://raw.githubusercontent.com/rcarrascosps/tester-kc/main/mule-tester/assets/bg.jpg?raw=true)

In the next screen select the environment, in this case is *tester* but select the one where you want to work in your tenant, and click the Next Button:

![Business Group](https://raw.githubusercontent.com/rcarrascosps/tester-kc/main/mule-tester/assets/bg2.jpg?raw=true)

The next step is a summary of the configuration of the connected app, just click on the *Add Scopes* button:

![Business Group](https://raw.githubusercontent.com/rcarrascosps/tester-kc/main/mule-tester/assets/bg3.jpg?raw=true)

Then you will be taken here, just click on the *Save* button:

![Create App Button](https://raw.githubusercontent.com/rcarrascosps/tester-kc/main/mule-tester/assets/createApp4.jpg?raw=true)

You will get back to the connected apps screen where you will see listed the newly create app:




`cd 'api-catalog-cli/Follow Tutorial'`{{exec}}

