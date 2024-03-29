
<br>

In this scenario we'll learn how to install and use MuleSoft API Catalog to import APIs and Assets to MuleSoft Anypoint Exchange.

The pre-requisites for this scenario are:


-   **Anypoint Platform**  - You will need an Anypoint Platform account to catalog APIs to Anypoint Exchange. You can sign up for a free trial account  [here](https://anypoint.mulesoft.com/login/#/signup?apintent=generic).
-   **API Catalog CLI permissions**  - Enable the  **API Catalog Contributor**  permission in Anypoint Platform. For detailed instructions, see  [Before You Begin](https://docs.mulesoft.com/exchange/apicat-get-started#configure-api-catalog-cli-permissions).
-   **Acquire Organization ID**  - Log in to  [Anypoint Platform](https://anypoint.mulesoft.com/)  and go to API Manager. Click on the Environment Information button to retrieve your  **Business Group ID**  (or Organization ID).
-   **NodeJS**  and  **npm**  - This is going to be installed as part of the scenario.
-   **Code Editor**  - We will the use the Killercoda code editor
-   **Project files**  - We will use an existant Github repo. All credits to my friend Alex Martínez. Repo is [here https://github.com/mulesoft-developers/api-catalog-cli]. We will use that content to automate it and execute it here in Killercoda.


In the scenario you will learn:

- How to **create a connected app** with the right scopes to use the API Catalog CLI.
- How to **introspect a set of API specs** from your file-system and publish them into Anypoint Exchange
- How to user **different MuleSot Anypoint API Catalog** commands

