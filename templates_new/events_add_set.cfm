<cfquery name="getlocation" datasource="#application.datasource_select#">
select location_name
from CUNVMCS.locations
where	locationid=#form.locationid#
</cfquery>


<cfset temp = "#form.information#">
<cfset temp2 = replace(temp,chr(13)&chr(10)&chr(13)&chr(10),"<p>","all")>
<cfset temp3 = replace(temp2,chr(13)&chr(10),"<br/>","all")>
<cfset temp4 = replace(temp3,chr(32)&chr(32)&chr(32),"&nbsp;&nbsp;&nbsp;","all")>
<cfset formatinformation= replace(temp4,chr(9),"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;","all")>
<cfset information="#formatinformation#">
<cfset pubdate="#form.pubdate#">
<cfset pulldate="#dateadd("h",23, form.pulldate)#">
<cfset startdate="#form.startdate#">
<cfset enddate="#form.enddate#">
<cfset longdesc="#form.longdesc#">
<cfset shortdesc="#form.shortdesc#">
<cfset events_link="#form.events_link#">
<cfset sponsor="#form.sponsor#">
<cfset contact="#form.contact#">
<cfset specificlocation="#form.specificlocation#">		
	<cfif parameterexists(locationid)>	
	<cfset locationid="#form.locationid#">
	<cfelse>
		<cfset locationid="21">
	</cfif>
<cfset location_name="#getlocation.location_name#">
<cfset ispublic="#form.ispublic#">

<!--for RSVP down the line-->
<!---
<cfset rsvp="#form.rsvp#">
<cfset rsvpp="#form.rsvpp#">--->

<cfset rsvp="0">
<cfset rsvpp="0">
<cfset events_cost="#form.cost#">	
	
	<cfif isdefined("form.post") or isdefined("form.publish")>			
		<cfif isdefined("form.post")>		
		<cfset post="#form.post#">
		</cfif>
		<cfif isdefined("form.publish")>		
		<cfset publish="#form.publish#">
		</cfif>
	<cfelse>
You must choose at least one site to post or publish to.
		<cfabort>
	</cfif>
	
	<cfif isdefined("form.audience")>			
		<cfif isdefined("form.audience")>		
			<cfset audience="#form.audience#">
		</cfif>
	<cfelse>
You must choose at least one audience for this event.
		<cfabort>		
	</cfif>
