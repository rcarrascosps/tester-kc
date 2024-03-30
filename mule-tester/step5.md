
### Authenticate to MuleSoft Anypoint Platform and get an access token

In the previous step we prepared our credentials to obtain an access token from MuleSoft Anypoint Platform to allow the MuleSot API Catalog CLI to inject assets into 
Mulesoft Exchange.

With those credentials we will generate an access token using cURL

```
authRequest=$(curl --silent --location --request POST https://anypoint.mulesoft.com/accounts/api/v2/oauth2/token --header 'Content-Type: application/x-www-form-urlencoded' -u ${authString} --data-urlencode 'grant_type=client_credentials' --data-urlencode 'scope=full')
echo $authRequest
```{{exec}}



