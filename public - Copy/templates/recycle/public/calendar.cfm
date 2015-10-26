
<!doctype html public "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml: lang="en" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>Loyola University Chicago: Inner Template</title>
</head>



<cfparam name="month" default="#DatePart('m', Now())#">
<cfparam name="year" default="#DatePart('yyyy', Now())#">
<cfparam name="week" default="#DatePart('ww', Now())#">

<cfif isDefined("url.siteid") IS 0>
	<cfset url.siteid = 0>
</cfif>

<cfif isDefined("url.audience") IS 0>
	<cfset url.audience = 0>
</cfif>

<cfif isDefined("url.month") IS 0>
	<cfset url.month = "#DatePart('m', Now())#">
</cfif>

<cfif isDefined("url.year") IS 0>
	<cfset url.year = "#DatePart('yyyy', Now())#">
</cfif>

<cfif isDefined("url.day") IS 0>
	<cfset url.day = "#DatePart('d', Now())#">
</cfif>

<cfif isDefined("url.week") IS 0>
	<cfset url.week = "#DatePart('ww', Now())#">
</cfif>

<cfif isDefined("url.range") IS 0>
	<cfset url.range = 'd'>
</cfif>

<cfif url.range is 'd'>
	<cfset daterangebeg=#createdate(url.year,url.month,url.day)#>
	<cfset daterangeend=#dateadd('d',0,daterangebeg)#>
<cfelseif url.range is 'w' or  url.range is 'ww'>
	<cfset daterangebeg=#createdate(url.year,url.month,url.day)#>
	<cfset daterangebeg=DateAdd("d", -(DayOfWeek(daterangebeg)-1), daterangebeg)>
	<cfset daterangebeg=#createodbcdatetime(daterangebeg)#>
	<cfset daterangeend=#DateFormat(DateAdd("d", 7 - DayOfWeek(daterangebeg), daterangebeg), "mm/dd/yyyy")#>
	<cfset daterangeend=#createodbcdatetime(daterangeend)#>
<cfelseif url.range is 'm'>
	<cfset daterangebeg=#createdate(url.year,url.month,url.day)#>
	<cfset daterangeend=#dateadd('m',1,daterangebeg)#>
</cfif>

<cfif isDefined("url.view") IS 0>
	<cfset url.view = 'd'>
</cfif>

<!--- Set the requested (or current) month/year date and determine the number of days in the month. --->
<cfset ThisMonthYear = CreateDate(year, month, '1')>

<cfset Days = DaysInMonth(ThisMonthYear)>



<!--- Set the values for the previous and next months for the back/next links. --->
<cfset LastMonthYear = DateAdd('m', -1, ThisMonthYear)>
<cfset LastMonth = DatePart('m', LastMonthYear)>
<cfset LastYear = DatePart('yyyy', LastMonthYear)>
<cfset LastWeek  = Datepart('ww',DateAdd('ww',-1, url.week))>

<cfset NextWeekDay=Datepart('d',DateAdd("d", 8 - DayOfWeek(daterangebeg), daterangebeg))>
<cfset NextWeekMonth=Datepart('m',DateAdd("d", 8 - DayOfWeek(daterangebeg), daterangebeg))>
<cfset NextWeekYear=Datepart('yyyy',DateAdd("d", 8 - DayOfWeek(daterangebeg), daterangebeg))>
<cfset NextWeekMonth=Datepart('m',DateAdd("d", 8 - DayOfWeek(daterangebeg), daterangebeg))>

<cfset LastWeekDay=Datepart('d',DateAdd("d", -7, daterangebeg))>
<cfset LastWeekMonth=Datepart('m',DateAdd("d", -7, daterangebeg))>
<cfset LastWeekYear=Datepart('yyyy',DateAdd("d", -7, daterangebeg))>
<cfset LastWeekMonth=Datepart('m',DateAdd("d", -7, daterangebeg))>

<cfset NextMonthYear = DateAdd('m', 1, ThisMonthYear)>
<cfset NextMonth = DatePart('m', DateAdd('m', 1, ThisMonthYear))>
<cfset NextYear = DatePart('yyyy', LastMonthYear)>
<cfset NextWeek  = Datepart('ww',DateAdd('ww',1, url.week))>




<!--- <cfoutput>daterangebeg:#variables.daterangebeg#<br />
daterangeend:#variables.daterangeend#<br />

LastMonthYear:#variables.LastMonthYear#<br />
LastMonth:#variables.LastMonth#<br />
LastYear:#variables.LastYear#<br />
LastWeek:#variables.LastWeek#<br />
NextMonthYear:#variables.NextMonthYear#<br />

NextYear:#variables.NextYear#<br />

<cfif url.range is 'w' or  url.range is 'ww'>
	NextWeekDay:#variables.NextWeekDay#<br />
	NextWeekYear:#variables.NextWeekYear#<br />
	NextWeekMonth:#variables.NextWeekMonth#
</cfif>
week: #url.week#</cfoutput> --->

<cfif url.siteid is 0>
	Master Calendar
<cfelse>
<cfquery datasource="#application.datasource_select#" name="getcalendar">
SELECT site_name
FROM CUNVMCS.sites
where siteid=#url.siteid#
</cfquery>
	<cfoutput>
#getcalendar.site_name#
	</cfoutput>
</cfif>

<cfif url.audience is 0>
	Calendar
<cfelse>
<cfquery datasource="#application.datasource_select#" name="getaudience">
SELECT title
FROM CUNVMCS.audiences
where audienceid=#url.audience#
</cfquery>
	<cfoutput>
	Calendar for #getaudience.title#
	</cfoutput>
</cfif>

<!--- <p><cfinclude template="calendar_navcalendar.cfm"></p> --->

<p><cfinclude template="calendar_navdrop.cfm"></p>

<p><cfinclude template="calendar_navview.cfm"></p>

<cfif url.view is 'd'>
	<cfinclude template="calendar_list.cfm">
<cfelseif url.view is 'm' or url.view is 'mw'>
	<cfinclude template="calendar_month.cfm">
<cfelse>
	<cfinclude template="calendar_week.cfm">
</cfif>




