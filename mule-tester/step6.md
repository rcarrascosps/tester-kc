### Let's generate a descriptor file

MuleSoft API Catalog CLI needs a descriptor file that gets generated with the following commnad:

`api-catalog create-descriptor`{{exec}}

In the project directory, you will see now a file named catalog.yaml. You can choose different name for your descriptor file using the -d <file name> flag

You can see the descriptor file in the Killercode editor tab, click on the tab and look for the file at the directory:...

### Test API Catalog

`api-catalog publish-asset --host=anypoint.mulesoft.com -d catalog.yaml --organization=$orgId --bearer=$accessToken --dry-run --verbose >> mycatdryrun.log`{{exec}}




