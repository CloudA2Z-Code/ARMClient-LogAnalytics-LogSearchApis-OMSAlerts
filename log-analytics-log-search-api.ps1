armclient login

############  To perform a search using ARMClient    ##############
armclient get /subscriptions/1412d889-28fa-474e-92a6-57fad2470952/resourceGroups/OMSWorkspaceFirstOne/providers/Microsoft.OperationalInsights/workspaces?api-version=2015-03-20


$mySearch = "{ 'top':150, 'query':'Error'}";

armclient post /subscriptions/1412d889-28fa-474e-92a6-57fad2470952/resourceGroups/OMSWorkspaceFirstOne/providers/Microsoft.OperationalInsights/workspaces/OMSWorkspaceFirstOne/search?api-version=2015-03-20 $mySearch

############  To perform a Search - Action/Read using ARMClient    ##############

/subscriptions/1412d889-28fa-474e-92a6-57fad2470952/resourceGroups/omsworkspacefirstone/providers/Microsoft.OperationalInsights/workspaces/omsworkspacefirstone/search?api-version=2015-03-20


########## Saved searches - Request List of Saved Searches ###############
armclient get /subscriptions/1412d889-28fa-474e-92a6-57fad2470952/resourceGroups/omsworkspacefirstone/providers/Microsoft.OperationalInsights/workspaces/omsworkspacefirstone/savedSearches?api-version=2015-03-20


######## Creating a saved searches - Request:  ###########
$savedSearchParametersJson = "{'properties': { 'Category': 'myCategory', 'DisplayName':'myDisplayName', 'Query':'* | measure Count() by Source', 'Version':'1'  }"

armclient put /subscriptions/1412d889-28fa-474e-92a6-57fad2470952/resourceGroups/omsworkspacefirstone/providers/Microsoft.OperationalInsights/workspaces/omsworkspacefirstone/savedSearches/SavedSearch6?api-version=2015-03-20 $savedSearchParametersJson

####### Deleting a saved searches - Request:  ###########
armclient delete /subscriptions/1412d889-28fa-474e-92a6-57fad2470952/resourceGroups/omsworkspacefirstone/providers/Microsoft.OperationalInsights/workspaces/omsworkspacefirstone/savedSearches/SavedSearch6?api-version=2015-03-20


####### Updating a saved searches - Request:  ###########

$savedSearchParametersJson = "{'etag': 'W/`"datetime\'2015-04-16T23%3A35%3A35.3182423Z\'`"', 'properties': { 'Category': 'myCategory', 'DisplayName':'myDisplayName', 'Query':'* | measure Count() by Source', 'Version':'1'  }"

armclient put /subscriptions/1412d889-28fa-474e-92a6-57fad2470952/resourceGroups/omsworkspacefirstone/providers/Microsoft.OperationalInsights/workspaces/omsworkspacefirstone/savedSearches/SavedSearch6?api-version=2015-03-20 $savedSearchParametersJson


########### 

armclient get /subscriptions/{SubId}/resourceGroups/{ResourceGroupId}/providers/Microsoft.OperationalInsights/workspaces/{WorkspaceName}/schema?api-version=2015-03-20

armclient put /subscriptions/1412d889-28fa-474e-92a6-57fad2470952/resourceGroups/omsworkspacefirstone/providers/Microsoft.OperationalInsights/workspaces/omsworkspacefirstone/schema?api-version=2015-03-20


############   Creating or updating a computer group      #################

    $etag=Get-Date -Format yyyy-MM-ddThh:mm:ss.msZ
    $groupName="My Computer Group"
    $groupQuery = "Computer=srv* | Distinct Computer"
    $groupCategory="My Computer Groups"
    $groupID = "My Computer Groups | My Computer Group"

    $groupJson = "{'etag': 'W/`"datetime\'" + $etag + "\'`"', 'properties': { 'Category': '" + $groupCategory + "', 'DisplayName':'"  + $groupName + "', 'Query':'" + $groupQuery + "', 'Tags': [{'Name': 'Group', 'Value': 'Computer'}], 'Version':'1'  }"

    armclient put /subscriptions/1412d889-28fa-474e-92a6-57fad2470952/resourceGroups/omsworkspacefirstone/providers/Microsoft.OperationalInsights/workspaces/omsworkspacefirstone/savedSearches/$groupId`?api-version=2015-03-20 $groupJson

armclient get /subscriptions/1412d889-28fa-474e-92a6-57fad2470952/resourceGroups/omsworkspacefirstone/providers/Microsoft.OperationalInsights/workspaces/omsworkspacefirstone/savedSearches/$groupId`?api-version=2015-03-20



### Retrieving schedules

###########################  Use the Get method to retrieve all schedules for a saved search. ###########################

armclient get /subscriptions/{Subscription ID}/resourceGroups/OI-Default-East-US/providers/Microsoft.OperationalInsights/workspaces/{Workspace Name}/savedSearches/{Search  ID}/schedules?api-version=2015-03-20

armclient get /subscriptions/1412d889-28fa-474e-92a6-57fad2470952/resourceGroups/omsworkspacefirstone/providers/Microsoft.OperationalInsights/workspaces/omsworkspacefirstone/savedSearches/savedsearch6/schedules?api-version=2015-03-20
armclient get /subscriptions/1412d889-28fa-474e-92a6-57fad2470952/resourceGroups/omsworkspacefirstone/providers/Microsoft.OperationalInsights/workspaces/omsworkspacefirstone/savedSearches/My Computer Group/schedules?api-version=2015-03-20
armclient get /subscriptions/1412d889-28fa-474e-92a6-57fad2470952/resourceGroups/omsworkspacefirstone/providers/Microsoft.OperationalInsights/workspaces/omsworkspacefirstone/savedSearches/SavedSearch7/schedules?api-version=2015-03-20


########### Use the Get method with a schedule ID to retrieve a particular schedule for a saved search. ##########
armclient get /subscriptions/1412d889-28fa-474e-92a6-57fad2470952/resourceGroups/omsworkspacefirstone/providers/Microsoft.OperationalInsights/workspaces/omsworkspacefirstone/savedSearches/SavedSearch7/schedules/{Schedule ID}?api-version=2015-03-20


###########  Creating a schedule   ########################
$scheduleJson = "{'properties': { 'Interval': 15, 'QueryTimeSpan':15, 'Active':'true' } }"
armclient put /subscriptions/1412d889-28fa-474e-92a6-57fad2470952/resourceGroups/omsworkspacefirstone/providers/Microsoft.OperationalInsights/workspaces/omsworkspacefirstone/savedSearches/SavedSearch3/schedules/mynewschedule?api-version=2015-03-20 $scheduleJson


##########Editing a schedule

########### Use the Put method with an existing schedule ID for the same saved search to modify that schedule. The body of the request must include the etag of the schedule.#########

# $scheduleJson = "{'etag': 'W/\"datetime'2016-02-25T20%3A54%3A49.8074679Z'\""','properties': { 'Interval': 15, 'QueryTimeSpan':15, 'Active':'true' } }"

armclient put /subscriptions/{Subscription ID}/resourceGroups/OI-Default-East-US/providers/Microsoft.OperationalInsights/workspaces/{Workspace Name}/savedSearches/{Search ID}/schedules/mynewschedule?api-version=2015-03-20 $scheduleJson


######### Deleting schedules

##################### Use the Delete method with a schedule ID to delete a schedule.   ###########

armclient delete /subscriptions/{Subscription ID}/resourceGroups/OI-Default-East-US/providers/Microsoft.OperationalInsights/workspaces/{Workspace Name}/savedSearches/{Subscription ID}/schedules/{Schedule ID}?api-version=2015-03-20


######## 

armclient get /subscriptions/{Subscription ID}/resourceGroups/OI-Default-East-US/providers/Microsoft.OperationalInsights/workspaces/{Workspace Name}/savedSearches/{Search  ID}/schedules/{Schedule ID}/actions?api-version=2015-03-20




################ Email Notification ###########  Use the Put method with a unique action ID to create a new e-mail action for a schedule. The following example creates an email notification with a threshold so the mail is sent when the results of the saved search exceed the threshold.  ###########

$emailJson = "{'properties': { 'Name': 'MyEmailAction', 'Version':'1', 'Type':'Alert', 'Threshold': { 'Operator': 'gt', 'Value': 10 }, 'EmailNotification': {'Recipients': ['recipient1@contoso.com', 'recipient2@contoso.com'], 'Subject':'This is the subject', 'Attachment':'None'} }"

armclient put /subscriptions/{Subscription ID}/resourceGroups/OI-Default-East-US/providers/Microsoft.OperationalInsights/workspaces/{Workspace Name}/savedSearches/{Search ID}/schedules/{Schedule ID}/actions/myemailaction?api-version=2015-03-20 $emailJson


############### Use the Put method with an existing action ID to modify an e-mail action for a schedule. The body of the request must include the etag of the action.   ###########

$emailJson = "{'etag': 'W/\"datetime'2016-02-25T20%3A54%3A20.1302566Z'\"','properties': { 'Name': 'MyEmailAction', 'Version':'1', 'Type':'Alert', 'Threshold': { 'Operator': 'gt', 'Value': 10 }, 'EmailNotification': {'Recipients': ['recipient1@contoso.com', 'recipient2@contoso.com'], 'Subject':'This is the subject', 'Attachment':'None'} }"

armclient put /subscriptions/{Subscription ID}/resourceGroups/OI-Default-East-US/providers/Microsoft.OperationalInsights/workspaces/{Workspace Name}/savedSearches/{Search ID}/schedules/{Schedule ID}/actions/myemailaction?api-version=2015-03-20 $emailJson

############## 