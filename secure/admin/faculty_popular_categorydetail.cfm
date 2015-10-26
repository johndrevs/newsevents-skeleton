<cfset daterangebeg=#createodbcdate(now())#>
	<cfset daterangebeg=DateAdd("d", -(DayOfWeek(daterangebeg)-1), daterangebeg)>
	<cfset daterangebeg=#createodbcdatetime(daterangebeg)#>
	<cfset daterangeend=#DateFormat(DateAdd("d", -14 - DayOfWeek(daterangebeg), daterangebeg), "mm/dd/yyyy")#>
	<cfset daterangeend=#createodbcdatetime(daterangeend)#>


 <cfquery name="gettop5cat" datasource="#application.datasource_select#">
SELECT     COUNT(CATEGORY_LOG.CATEGORY_ID) AS totallogins, CATEGORY_LOG.CATEGORY_ID, CATEGORY_NAME
FROM         CUNVMCS.CATEGORY_LOG, CUNVMCS.CATEGORIES
WHERE CATEGORIES.CATEGORY_ID=CATEGORY_LOG.CATEGORY_ID and CATEGORIES.ACTIVE=1 and sub=1 and CATEGORY_LOG.CATEGORY_ID=#url.category_id#
GROUP BY CATEGORY_LOG.CATEGORY_ID, CATEGORY_NAME
order by totallogins desc</cfquery>	 

<cfquery name="gettop5catdet" datasource="#application.datasource_select#">
SELECT    datetime
FROM         CUNVMCS.CATEGORY_LOG
WHERE CATEGORY_LOG.CATEGORY_ID=#url.category_id# and  (to_char(datetime, 'yyyy-mm-dd') >= to_char(#variables.daterangeend#, 'yyyy-mm-dd'))
order by datetime desc</cfquery>	

<cfset page='admin'>
<cfset sort='no'>
<cfinclude template="/newsevents/secure/templates/top.cfm">

<h2>Hot Topics</h2>

	<table border="0" cellspacing="1" cellpadding="4" class="tabulargrey">

			<cfoutput query="gettop5cat" maxrows=1><tr><th>#category_name#</th></tr></cfoutput>
	
	<cfoutput query="gettop5catdet"><tr><td>#dateformat(datetime, "mmm dd.yyy")# #timeformat(datetime, "hh:mm:ss")#</td></tr></cfoutput>



</table>

<cfinclude template="/newsevents/secure/templates/footer.cfm">
