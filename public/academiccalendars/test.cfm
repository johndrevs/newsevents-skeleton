<cfquery name="getevents" datasource="#application.datasource_select#">
select events_tbl.eventid,shortdesc,startdate,info_clob,enddate
from CUNVMCS.events_tbl, CUNVMCS.events_ref
		where	0=0 and events_tbl.isactive=1 and events_ref.eventid=events_tbl.eventid and events_ref.siteid=135 and events_ref.events_ref_level =2
	and to_char(pubdate, 'yyyy-mm-dd') <= to_char(SYSDATE, 'yyyy-mm-dd') and to_char(pulldate, 'yyyy-mm-dd') >= to_char(SYSDATE, 'yyyy-mm-dd')
	order by startdate</cfquery>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Loyola University Chicago: Academic Calendar</title>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="Description" content="Academic Calendar">
<meta name="keywords" content="Academic Calendar">





<table width="100%" cellspacing="0" cellpadding="6" class="tabulargrey">

		<cfoutput query="getevents"><tr>
			<td nowrap><cfif datecompare(getevents.startdate,getevents.enddate,"d") NEQ 0>
			#dateformat(startdate, "mmmm d")#-#dateformat(enddate, "d")#	
			
	<cfelseif datecompare(getevents.startdate,getevents.enddate,"d") EQ 0>
		#dateformat(startdate, "mmmm d")#
	
	</cfif></td>
			
			<td>|#shortdesc#|#info_clob#</td>
		</tr></cfoutput>
</table>	







