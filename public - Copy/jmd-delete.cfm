<cfset currentdate = CreateDate(2013, 10, 25)>

<cfquery name="getevent" datasource="#application.datasource_select#" maxrows=20>
SELECT distinct events_tbl.eventID, shortdesc,  startdate, enddate, events_link_override,events_link, locationid,specificlocation,events_cost,contact
FROM CUNVMCS.events_tbl,  CUNVMCS.events_audref
WHERE ((to_char(startdate, 'yyyy-mm-dd') <= to_char(<cfqueryparam value="#dateformat(currentdate,"yyyy-mm-dd")#" cfsqltype="CF_SQL_DATE">, 'yyyy-mm-dd') and to_char(enddate, 'yyyy-mm-dd') >= to_char(<cfqueryparam value="#dateformat(currentdate,"yyyy-mm-dd")#" cfsqltype="CF_SQL_DATE">, 'yyyy-mm-dd')) OR (to_char(startdate, 'yyyy-mm-dd') = to_char(<cfqueryparam value="#dateformat(currentdate,"yyyy-mm-dd")#" cfsqltype="CF_SQL_DATE">, 'yyyy-mm-dd') and enddate is NULL))
	
AND events_audref.eventid=events_tbl.eventid 
	
and to_char(pubdate, 'yyyy-mm-dd') <= to_char(SYSDATE, 'yyyy-mm-dd') 
and to_char(pulldate, 'yyyy-mm-dd') >= to_char(SYSDATE, 'yyyy-mm-dd') 
and  events_tbl.isactive=1 






and  events_tbl.eventid IN (select events_ref.eventid from CUNVMCS.events_ref where 0=0
				
	and events_ref.siteid in (0)
)
order by events_tbl.startdate</cfquery>

<cfdump var="#getevent#">

<cfquery name="getevent2" datasource="#application.datasource_select#" maxrows=20>
SELECT distinct events_tbl.eventID, shortdesc,  startdate, enddate, events_link_override,events_link, locationid,specificlocation,events_cost,contact
FROM CUNVMCS.events_tbl,  CUNVMCS.events_audref
WHERE events_tbl.eventID =59372
</cfquery>

<cfdump var="#getevent2#">

<cfquery name="getevent3" datasource="#application.datasource_select#" maxrows=20>
SELECT distinct events_audref.eventID, shortdesc,  startdate, enddate, events_link_override,events_link, locationid,specificlocation,events_cost,contact
FROM CUNVMCS.events_tbl,  CUNVMCS.events_audref
WHERE events_audref.eventID =59372
</cfquery>
<cfdump var="#getevent3#">