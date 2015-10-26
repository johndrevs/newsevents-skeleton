<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>Untitled</title>
</head>
<cfquery name="getlocations" datasource="newsandevents">
SELECT      locations.name, locations.address, locations.subaddress, locations.link, users.lastname, users.firstname
FROM         locations, users 
WHERE       locations.creator = users.userid and locationid=#url.locationid#</cfquery>
<body>
<cfoutput query="getlocations">Name: #name#<br/>
#address#<br/>
#subaddress#<p>
Link: #link#<br/>
Created by: #firstname# #lastname#
</cfoutput>


</body>
</html>
