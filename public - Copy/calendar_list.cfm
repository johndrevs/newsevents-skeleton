
<cfquery name="getevent2" datasource="#application.datasource_select#">
SELECT events_tbl.eventid,shortdesc,startdate,enddate,INFO_CLOB
from CUNVMCS.events_tbl, CUNVMCS.events_ref
where	0=0 and events_tbl.isactive=1 and events_ref.eventid=events_tbl.eventid <cfif url.siteid is not 0>and events_ref.siteid in (#url.siteid#)</cfif> and events_ref.events_ref_level =2 and to_char(pubdate, 'yyyy-mm-dd') <= to_char(SYSDATE, 'yyyy-mm-dd') and to_char(pulldate, 'yyyy-mm-dd') >= to_char(SYSDATE, 'yyyy-mm-dd') AND ((to_char(startdate, 'yyyy-mm-dd') <= '#dateformat(daterangebeg,"yyyy-mm-dd")#' and to_char(enddate, 'yyyy-mm-dd') >= '#dateformat(daterangeend,"yyyy-mm-dd")#') OR (to_char(startdate, 'yyyy-mm-dd') = '#dateformat(daterangebeg,"yyyy-mm-dd")#' and enddate is NULL))

</cfquery>




<cfoutput>
Events for:
	<cfif datecompare(daterangebeg,daterangeend) is 0>
		#dateformat(daterangebeg, "dddd, mmmm d, yyyy")#
	<cfelse>
		#dateformat(daterangebeg, "dddd, mmmm d, yyyy")# through #dateformat(daterangeend, "dddd, mmmm d, yyyy")#
	</cfif>
</cfoutput>



<cfoutput query="getevent2">
<p><a href="events_detail.cfm?eventid=#eventid#&siteid=#url.siteid#">#shortdesc#</a><br/>

<cfif getevent2.enddate is ''>		
		#dateformat(getevent2.startdate,"dddd mmmm d yyyy")#  #timeformat(getevent2.startdate,"h:mm tt")#	
	<cfelseif datecompare(getevent2.startdate,getevent2.enddate,"d") NEQ 0>
		#dateformat(getevent2.startdate,"dddd mmmm d yyyy")# at #timeformat(getevent2.startdate,"h:mm tt")#
		<br/>to
		<br/>#dateformat(getevent2.enddate,"dddd mmmm d yyyy")# at #timeformat(getevent2.enddate,"h:mm tt")#	
	<cfelseif datecompare(getevent2.startdate,getevent2.enddate,"d") EQ 0>
		#dateformat(getevent2.startdate,"dddd mmmm d yyyy")# at #timeformat(getevent2.startdate,"h:mm tt")# - #timeformat(getevent2.enddate,"h:mm tt")#
	</cfif><br />
	
#INFO_CLOB#</p>
</cfoutput>
