
  <!--- get and read the CSV-TXT file ---> 
<cffile action="read" file="/var/www/html/newsevents/public/CalendarExport.csv" variable="csvfile"> 
 <table>
<tr>
	<td>Subject</td>
	<td>Start Date/Time</td>
	
	<td>End Date/Time</td>
	
	<td>De scription</td>
	<td>Location ID</td>
</tr>
<!--- loop through the CSV-TXT file on line breaks and insert into database ---> 
<cfoutput> <cfloop index="line" list="#csvfile#" delimiters="#chr(10)##chr(13)#"> 
     
        <tr>
	<td>#left(listgetAt('#line#',1, ','), 50)#</td>
	<td><cfif listgetAt('#line#',3, ',') eq 'x'>'#dateformat(listgetAt('#line#',2, ','), "yyyy/mm/dd")#  01:00:00'<cfelse>'#dateformat(listgetAt('#line#',2, ','), "yyyy/mm/dd")#  #timeformat(listgetAt('#line#',3, ','), "HH:mm:ss")#'</cfif></td>
	
	<td><cfif listgetAt('#line#',5, ',') eq 'x'>NULL<cfelse>'#dateformat(listgetAt('#line#',4, ','), "yyyy/mm/dd")#  #timeformat(listgetAt('#line#',5, ','), "HH:mm:ss")#'</cfif></td>
	
	<td>'#listgetAt('#line#',6, ',')#'</td>
	<td>'#listgetAt('#line#',7, ',')#'</td>
</tr> 
<cflock timeout="20" throwontimeout="No" type="EXCLUSIVE">
<cfquery name="insert_news" datasource="#application.datasource_update#">
			INSERT INTO CUNVMCS.events_tbl(lastmod,isactive,PUBDATE,PULLDATE,STARTDATE,ENDDATE,SHORTDESC,ISPUBLIC,INFO_CLOB,userid,locationid,contact,created,status,recurring_status,creator)
				VALUES(SYSDATE,1,
				to_date ('2007/02/06 8:00:00', 'yyyy/mm/dd hh24:mi:ss'),
				to_date ('2010/02/06 8:00:00', 'yyyy/mm/dd hh24:mi:ss'),
				to_date (<cfif listgetAt('#line#',3, ',') eq 'x'>'#dateformat(listgetAt('#line#',2, ','), "yyyy/mm/dd")#  01:00:00'<cfelse>'#dateformat(listgetAt('#line#',2, ','), "yyyy/mm/dd")#  #timeformat(listgetAt('#line#',3, ','), "HH:mm:ss")#'</cfif>, 'yyyy/mm/dd hh24:mi:ss'),
				<cfif listgetAt('#line#',5, ',') eq 'x'>NULL<cfelse>to_date ('#dateformat(listgetAt('#line#',4, ','), "yyyy/mm/dd")#  #timeformat(listgetAt('#line#',5, ','), "HH:mm:ss")#', 'yyyy/mm/dd hh24:mi:ss')</cfif>,
				'#left(listgetAt('#line#',1, ','), 50)#', 1, 'x', 262, <cfif listgetAt('#line#',7, ',') eq 'x'>0<cfelse>#listgetAt('#line#',7, ',')#</cfif>, 'Elisabeth Brookover',   SYSDATE, 1,1,262)
		</cfquery>
		<cfquery datasource="#application.datasource_select#" name="getID">
			SELECT MAX(eventID) as MaxID
			FROM CUNVMCS.events_tbl
		</cfquery></cflock>
<cfquery name="updateevents" datasource="#application.datasource_update#">
		update     CUNVMCS.events_tbl
SET       
INFO_CLOB=<cfqueryparam value="#listgetAt('#line#',6, ',')#" cfsqltype="CF_SQL_CLOB">
where eventid=#getid.maxID#
</cfquery>
		assosciates publish			

				<cfquery datasource="#application.datasource_update#" name="insertpost">
					INSERT INTO CUNVMCS.events_ref(eventID, siteID, actiondate,EVENTS_REF_level,userid)
					VALUES(#getid.maxID#, 138, SYSDATE,1,262)
				</cfquery>
	
		<cfset form.audience='25,21,23,42,41,22,24'>
		
		<cfif isdefined("form.audience")>
			<cfloop list="#form.audience#" index="n">
				<cfquery datasource="#application.datasource_update#" name="insertaudience">
					INSERT INTO CUNVMCS.events_audref(eventID, audienceID, actiondate,userid)
					VALUES(#getid.maxID#, #n#, SYSDATE,262)
				</cfquery>
			</cfloop>
		</cfif>
		

</cfloop>  </cfoutput>

</table>
	 




