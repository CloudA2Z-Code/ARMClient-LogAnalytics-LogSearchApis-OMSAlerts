


armclient GET /subscriptions/1412d889-28fa-474e-92a6-57fad2470952/resourceGroups/TestRG/providers/Microsoft.Web/sites?api-version=2014-11-01


armclient PUT /subscriptions/1412d889-28fa-474e-92a6-57fad2470952/resourceGroups/TestRG/providers/Microsoft.Web/sites/MyCoolSite12345?api-version=2014-11-01 "{location: 'North Europe', properties: {}}"



# USing ARMCLIENT commands insie powershell

$sitePath = "/subscriptions/1412d889-28fa-474e-92a6-57fad2470952/resourceGroups/TestRG/providers/Microsoft.Web/sites/MyCoolSite12345"
$res = ([string] (armclient POST "$sitePath/config/appsettings/list?api-version=2014-11-01")) | ConvertFrom-Json
$res.properties | Add-Member -Force "foo" "From PowerShell!"
$res | ConvertTo-Json | armclient PUT "$sitePath/config/appsettings?api-version=2014-11-01"