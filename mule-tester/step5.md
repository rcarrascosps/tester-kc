### Authenticate to MuleSoft Anypoint Platform and get an access token

In the previous step we prepared our credentials to obtain an access token from MuleSoft Anypoint Platform to allow the MuleSot API Catalog CLI to inject assets into 
Mulesoft Exchange.

With those credentials we will generate an access token using cURL:

```
authRequest=$(curl --silent --location --request POST https://anypoint.mulesoft.com/accounts/api/v2/oauth2/token --header 'Content-Type: application/x-www-form-urlencoded' -u ${authString} --data-urlencode 'grant_type=client_credentials' --data-urlencode 'scope=full')
accessToken=$(jq -r '.access_token' <<< "$authRequest")
echo $accessToken
```{{exec}}



### Get your Organiation Id

Now, let's get the Organization Id from your environment. Get back to the Anypoint Platform Console and head into the API Manager module:

![API Manager](https://raw.githubusercontent.com/rcarrascosps/tester-kc/main/mule-tester/assets/apiMan1.jpg?raw=true)

Next, copy the Organization Id from the URL at the browser address:

![API Manager](https://raw.githubusercontent.com/rcarrascosps/tester-kc/main/mule-tester/assets/apiMan2.jpg?raw=true)

Paste it as the response from the next command:

```
echo "Please enter your Organization id: "
read orgId
```{{exec}}




