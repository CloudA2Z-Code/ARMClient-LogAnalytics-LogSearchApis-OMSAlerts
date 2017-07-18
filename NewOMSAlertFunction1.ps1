function New-OMSAlert($name, $savedSearchId)
{

#if the below variables are passed on via function we can place them in the url directly , Validations on them would be great to avoid further issues i.e. NUll issues etc.
$subID = "*************************"
$resourceGroup = "rg-****************"
$workspaceName = "*********"

### New Variables added 
$scheduleid = "$savedSearchId-$name"

armclient login

################ Creating a Web hook alert ###########
$webHookAlertJson = "{'properties': { 'Name': $name, 'Version':'1', 'Type':'Alert', 'Threshold': { 'Operator': 'gt', 'Value': 10 } }"

armclient put /subscriptions/$subID/resourceGroups/$resourceGroup/providers/Microsoft.OperationalInsights/workspaces/$workspaceName/savedSearches/$savedSearchId/schedules/$scheduleid/actions/$name-hook" + "?api-version=2015-03-20 $webHookAlertJson

}


################ Email Notification ###########  Use the Put method with a unique action ID to create a new e-mail action for a schedule. The following example creates an email notification with a threshold so the mail is sent when the results of the saved search exceed the threshold.  ###########
function NewOMSEmailAlert()
{
#if the below variables are passed on via function we can place them in the url directly , Validations on them would be great to avoid further issues i.e. NUll issues etc.
$subID = "*************************"
$resourceGroup = "rg-****************"
$workspaceName = "*********"

### New Variables added 
$scheduleid = "$savedSearchId-$name"

armclient login

$emailJson = "{'properties': { 'Name': 'newWebhookAlertMail', 'Version':'1', 'Type':'Alert', 'Threshold': { 'Operator': 'gt', 'Value': 10 }, 'EmailNotification': {'Recipients': ['recipient1@xyz.com', 'recipient2@xyz.com'], 'Subject':'Subject liner', 'Attachment':'None'} }"

armclient put /subscriptions/$subID/resourceGroups/$resourceGroup/providers/Microsoft.OperationalInsights/workspaces/$workspaceName/savedSearches/$savedSearchId/schedules/$scheduleid/actions/newWebhookAlertMail?api-version=2015-03-20 $emailJson

}