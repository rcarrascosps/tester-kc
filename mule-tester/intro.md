<style>
r { color: Red }
o { color: Orange }
g { color: Green }
</style>

<br>

<span style="color: red;">text</span>.

In this scenario we'll learn how to install and use MuleSoft API Catalog to import APIs and Assets to MuleSoft Anypoint Exchange.

<r>**!!! IMPORTANT !!!**</r>


**Do not proceed to the next step the systems gets udpdated and upgraded**. In the right window we are preparing that for you. In a few minutes you should see the next window apppear:

![Ubuntu](https://raw.githubusercontent.com/rcarrascosps/tester-kc/main/mule-tester/assets/intro.jpg?raw=true)

**When that occurs choose the option that is displayed in the previous option, and hit the OK button. To hit the OK button, use the tab key.**
**Once you hit the OK button the system will finalize its update and upgrade.**

**You will notice** that the installation has finalized when you see the next information in the **right side of the window**:

![Ubuntu](https://raw.githubusercontent.com/rcarrascosps/tester-kc/main/mule-tester/assets/intro1.jpg?raw=true)

The pre-requisites for this scenario are:


-   **Anypoint Platform**  - You will need an Anypoint Platform account to catalog APIs to Anypoint Exchange. You can sign up for a free trial account  [here](https://anypoint.mulesoft.com/login/#/signup?apintent=generic).
-   **API Catalog CLI permissions**  - Enable the  **API Catalog Contributor**  permission in Anypoint Platform. You will perform it in the next steps.
-   **Acquire Organization ID**  - Log in to  [Anypoint Platform](https://anypoint.mulesoft.com/)  and go to API Manager. Click on the Environment Information button to retrieve your  **Business Group ID**  (or Organization ID).
-   **NodeJS**  and  **npm**  - This is going to be installed as part of the scenario.
-   **Code Editor**  - We will the use the Killercoda code editor
-   **Project files**  - We will use an existant Github repo. All credits to my friend Alex Martinez. Repo is [here https://github.com/mulesoft-developers/api-catalog-cli]. We will use that content to automate it and execute it here in Killercoda.


In the scenario you will learn:

- How to **create a connected app** with the right scopes to use the API Catalog CLI.
- How to **install the API Catalog CLI**.
- How to **authenticate the API Catalog CLI** to your Anypoint Platform Exchange using a Bearer Token acquired with connected app.  
- How to **introspect a set of API specs** from the file-system and publish them into Anypoint Exchange
- How to use **different MuleSot Anypoint API Catalog** commands

