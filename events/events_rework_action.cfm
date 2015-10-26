
<cfquery name="updateevents" datasource="#application.datasource_update#">
		update     CUNVMCS.events_tbl
SET       
shortdesc='#form.shortdesc#', 
longdesc='#form.longdesc#', 
INFO_CLOB='#form.information#', 
events_link='#form.events_link#',
locationid='#form.locationid#',
sponsor='#form.sponsor#',
contact='#form.contact#',
events_cost='#form.events_cost#',
ispublic='#form.ispublic#', 
rsvp='#form.rsvp#',
rsvp_public='#form.rsvpp#',
pubdate=to_date ('#dateformat(form.pubdate, "yyyy/mm/dd")##timeformat(form.pubdate, "hh:mm:00")#', 'yyyy/mm/dd hh24:mi:ss'),
pulldate=to_date ('#dateformat(form.pulldate, "yyyy/mm/dd")##timeformat(form.pulldate, "hh:mm:00")#', 'yyyy/mm/dd hh24:mi:ss'),
startdate=to_date ('#dateformat(form.startdate, "yyyy/mm/dd")##timeformat(form.startdate, "hh:mm:00")#', 'yyyy/mm/dd hh24:mi:ss'),
enddate=to_date ('#dateformat(form.enddate, "yyyy/mm/dd")##timeformat(form.enddate, "hh:mm:00")#', 'yyyy/mm/dd hh24:mi:ss'),
lastmod=SYSDATE<!---   --->
where eventid=#form.eventid#
</cfquery>

<cfif isdefined("form.audience")>
<cfquery datasource="#application.datasource_update#" name="deletereference">
					delete from CUNVMCS.events_audref where eventid=#form.eventid#
				</cfquery>
			<cfloop list="#form.audience#" index="n">
				<cfquery datasource="#application.datasource_update#" name="insertaudience">
					INSERT INTO CUNVMCS.events_audref(eventID, audienceID, actionDate,userid)
					VALUES(#form.eventid#, #n#, SYSDATE,#session.userid#)
				</cfquery>
			</cfloop>
		</cfif>

<Cfset notify=#form.notify#>
<cfinclude template="../templates/notify.cfm">
<!--- pubdate=#createodbcdate(form.pubdate)#, pulldate=#createodbcdate(form.pulldate)#, --->



 <cflocation url="index.cfm" addtoken="No">  