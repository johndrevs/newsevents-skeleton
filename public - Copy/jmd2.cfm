
<cfif isdefined("url.siteid")><cfset n=url.siteid><cfelse><cfset n=0></cfif><cfoutput>#n#</cfoutput>
<cfif isdefined("url.audienceid")><cfset x=url.audienceid><cfelse><cfset x=0></cfif><cfoutput>#x#</cfoutput>
<CFQUERY NAME="getsiteinfo" DATASOURCE="#application.datasource_select#">
SELECT      site_name, uri, description, maxrows
FROM         CUNVMCS.sites 
where siteid =#n#
</CFQUERY>

<cfparam name="month" default="#DatePart('m', Now())#">
<cfparam name="year" default="#DatePart('yyyy', Now())#">
<cfparam name="week" default="#DatePart('ww', Now())#">
<cfparam name="hour" default="#timeformat(Now(),'HH')#">
<cfparam name="minute" default="#DatePart('n', Now())#">
<cfif isDefined("url.day") IS 0>
	<cfset url.day = "#DatePart('d', Now())#">
<cfelseif url.day gt 27 and url.month is 2>
<cfset url.day = 27>
<cfelseif url.day is 31>
<cfset url.day = 30></cfif>
<cfset currentdate = CreateDatetime(year, month, day,hour,minute,'00')>
<cfquery datasource="#application.datasource_select#" name="getevent2">
SELECT distinct events_tbl.eventID, shortdesc,  startdate, events_link_override,events_link,enddate,locationid,  pubdate, SPECIFICLOCATION 
FROM CUNVMCS.events_tbl,  CUNVMCS.events_audref
WHERE isactive=1 AND shortdesc IS NOT NULL and shortdesc <> ' ' and ((to_char(startdate, 'yyyy-mm-dd HH24:MI') >= '#dateformat(currentdate,"yyyy-mm-dd HH:mm")#'))	
AND events_audref.eventid=events_tbl.eventid and to_char(pubdate, 'yyyy-mm-dd') <= to_char(SYSDATE, 'yyyy-mm-dd') and to_char(pulldate, 'yyyy-mm-dd') >= to_char(SYSDATE, 'yyyy-mm-dd') and  events_tbl.eventid IN (select events_ref.eventid from CUNVMCS.events_ref where 0=0
					
and events_ref.siteid in (#n#)
<cfif x is not 0>and events_audref.audienceid=#x#</cfif>
	
and events_ref.events_ref_level =2)
order by events_tbl.startdate<!--- --->
</cfquery>

<cfdump var="#getevent2#"><cfabort>

<cfquery name="getsites" datasource="#application.datasource_select#">
select events_ref.eventid, events_ref_level from CUNVMCS.events_ref where 0=0
					
and events_ref.siteid in (#n#)
<cfif x is not 0>and events_audref.audienceid=#x#</cfif>
	
and events_ref.events_ref_level =2
order by eventid desc</cfquery>

<cfdump var="#getsites#">