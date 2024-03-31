
### Set your credentials

Copy the value of the client_id. To do that, just click on the Copy Id button and paste it as the response of the following command (the following animated GIF will show you how).

![Client ID](https://raw.githubusercontent.com/rcarrascosps/tester-kc/main/mule-tester/assets/clientid.gif?raw=true)

```
echo "Please enter the client_id from the Copy Id button: "
read clientId 
```{{exec}}

Now, do the same thing but with the value of the client_secret. Click on the Copy Secret button and paste it as the response of the following command:

```
echo "Please enter the client_secret from the Copy Secret button: "
read clientSecret 
```{{exec}}



### Create the auth string

Now we need to create a string from the concatenation of the client_id + ":" + the client_secret value, since we are going to use it to cURL the MuleSoft Anypoint Platform
Authentication API Endpoint to get an access token that the MuleSoft API Catalog CLI will use.

`authString=$(echo -n $clientId":"$clientSecret)`{{exec}}

To validate that the base64 was created, execute the following command:

`echo $authString`{{exec}}

Now we are ready to generate the access token we will use in the Mulesoft API Catalog CLI.
