<cfquery name="getevents" datasource="#application.datasource_select#">
select events_tbl.eventid,shortdesc,startdate,info_clob,enddate
from CUNVMCS.events_tbl, CUNVMCS.events_ref
		where	0=0 and events_tbl.isactive=1 and events_ref.eventid=events_tbl.eventid and events_ref.siteid=135 and events_ref.events_ref_level =2
	and to_char(pubdate, 'yyyy-mm-dd') <= to_char(SYSDATE, 'yyyy-mm-dd') and to_char(pulldate, 'yyyy-mm-dd') >= to_char(SYSDATE, 'yyyy-mm-dd')
	order by startdate</cfquery>
	
	<cfif getevents.recordcount lt 1>
	<cflocation url="http://www.luc.edu/academics/schedules/##calendars" addtoken="No">
	<cfelse>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Loyola University Chicago: Academic Calendar</title>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="Description" content="Academic Calendar">
<meta name="keywords" content="Academic Calendar">

<!-- Page Header -->
<cfinclude template="/newsevents/public/ssi/header_simple.cfm">
<!-- End Page Header -->

<!-- Body Content Starts Here -->

<table border="0" width="670" cellspacing="0" cellpadding="20" summary="body table">
<tr><td valign="top">
<div class="text">
<div class="contentText">

<h1 class="headerText">Fall Semester 2005 Calendar</h1>

<table width="100%" cellspacing="0" cellpadding="6" class="tabulargrey">
		<tr>
			<th colspan="3">Academic Calendar</th>
		</tr>
		<cfoutput query="getevents"><tr>
			<td nowrap><cfif datecompare(getevents.startdate,getevents.enddate,"d") NEQ 0>
			#dateformat(startdate, "mmmm d")#-#dateformat(enddate, "d")#	
			
	<cfelse>
		#dateformat(startdate, "mmmm d")#
	
	</cfif></td>
			<td nowrap><cfif datecompare(getevents.startdate,getevents.enddate,"d") NEQ 0>
			#dateformat(startdate, "dddd")#-#dateformat(enddate, "dddd")#	
			
	<cfelse>
		#dateformat(startdate, "dddd")#
	
	</cfif></td>
			<td>#shortdesc#<cfif getevents.info_clob is '' or getevents.info_clob is 'x'><cfelse> #info_clob#</cfif></td>
		</tr></cfoutput>
</table>	



<p>&nbsp;</p>

<a href="#top"><img src="/images/totop.gif" border="0" width="75" height="13" alt="Back to Top"></a>

</div></div>
</td></tr>
</table>

<!-- Body Content Ends Here -->



<!-- Page Footer -->
<cfinclude template="/newsevents/public/ssi/footer.page.cfm">
<!-- End Page Footer -->


</cfif>