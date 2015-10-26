<cfset page='admin'>
<cfset sort='no'>
<cfinclude template="/newsevents/secure/templates/top.cfm">
<h2>View Survey Responders</h2>
<p>Please enter the last name of the survey responder whose response you would like to see:<BR>Leave blank to see all.

<form action="faculty_surveyresponders_list.cfm" method="post">
<input type="text" name="criteria"><br/>
Search: All Survey Responders <input type="radio" name="filter" value="1" checked> Only those not yet in the system <input type="radio" name="filter" value="0"><br/><input type="submit" value="search"></form></p>
<cfinclude template="/newsevents/secure/templates/footer.cfm">
