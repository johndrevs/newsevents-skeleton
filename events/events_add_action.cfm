<cfif form.enddate is ''>
<cfset form.enddate='NULL'>
<cfelse>
<cfset form.enddate=CreateODBCDateTime(form.enddate)>
</cfif>
	<cfif isdefined("form.post") or isdefined("form.publish")>
		<cflock timeout="20" throwontimeout="No" type="EXCLUSIVE">
		<cfquery name="insert_news" datasource="#application.datasource_update#">
			INSERT INTO CUNVMCS.events_tbl(lastmod,isactive,PUBDATE,PULLDATE,STARTDATE,<cfif form.enddate neq 'NULL'>ENDDATE,</cfif>SHORTDESC,LONGDESC,EVENTS_LINK,ISPUBLIC,RSVP,RSVP_PUBLIC,EVENTS_COST,INFO_CLOB,userid,locationid,specificlocation,contact,sponsor,created,status,recurring_status,creator)
				VALUES(SYSDATE,1,
				to_date ('#dateformat(form.pubdate, "yyyy/mm/dd")##timeformat(form.pubdate, "hh:mm:00")#', 'yyyy/mm/dd hh24:mi:ss'),
				to_date ('#dateformat(form.pulldate, "yyyy/mm/dd")##timeformat(form.pulldate, "hh:mm:00")#', 'yyyy/mm/dd hh24:mi:ss'),
				to_date ('#dateformat(form.startdate, "yyyy/mm/dd")##timeformat(form.startdate, "hh:mm:00")#', 'yyyy/mm/dd hh24:mi:ss'),
				<cfif form.enddate neq 'NULL'>to_date ('#dateformat(form.enddate, "yyyy/mm/dd")##timeformat(form.enddate, "hh:mm:00")#', 'yyyy/mm/dd hh24:mi:ss'),</cfif>
				'#form.shortdesc#', '#form.longdesc#','#form.events_link#',#form.ispublic#, #form.rsvp#, #form.rsvpp#, '#form.events_cost#', '#removechars(form.information, 1, 255)#',#form.userid#,#form.locationid#,'#form.specificlocation#','#form.contact#','#form.sponsor#',SYSDATE,1,1,#form.userid#)
		</cfquery>
		<cfquery datasource="#application.datasource_select#" name="getID">
			SELECT MAX(eventID) as MaxID
			FROM CUNVMCS.events_tbl
		</cfquery>
		</cflock>
		
		assosciates publish			
		
		<cfif isdefined("form.post")>
			<cfloop list="#form.post#" index="n">
				<cfquery datasource="#application.datasource_update#" name="insertpost">
					INSERT INTO CUNVMCS.events_ref(eventID, siteID, actiondate,EVENTS_REF_level,userid)
					VALUES(#getid.maxID#, #n#, SYSDATE,1,#form.userid#)
				</cfquery>
			</cfloop>
		</cfif>
		
		<cfif isdefined("form.publish")>
			<cfloop list="#form.publish#" index="n">
				<cfquery datasource="#application.datasource_update#" name="insertpublish">
					INSERT INTO CUNVMCS.events_ref(eventID, siteID, actiondate,EVENTS_REF_level,userid)
					VALUES(#getid.maxID#, #n#, SYSDATE,2,#form.userid#)
				</cfquery>
			</cfloop>
		</cfif>
		
		<cfif isdefined("form.audience")>
			<cfloop list="#form.audience#" index="n">
				<cfquery datasource="#application.datasource_update#" name="insertaudience">
					INSERT INTO CUNVMCS.events_audref(eventID, audienceID, actiondate,userid)
					VALUES(#getid.maxID#, #n#, SYSDATE,#form.userid#)
				</cfquery>
			</cfloop>
		</cfif>
		
	<cfelse>
You must choose at least one site to post or publish to.
	</cfif>
inserts into new
<cfoutput><cflocation url="#form.location#" addtoken="No"></cfoutput>