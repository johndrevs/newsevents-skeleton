
<cfinclude template="/newsevents/templates/securityheader.cfm">

<cfquery name="getnews" datasource="#application.datasource_select#">
select news.newsid, shorttitle,longtitle,desc_clob,content2,byline,bylinetitle, dateline,pubdate,pulldate,userid
from CUNVMCS.news
where	news.newsid=#url.newsid#
</cfquery>


<cfset page='news'>
<cfset sort='no'>
<cfinclude template="/newsevents/templates_new/top.cfm">

<h2>Rework News Item</h2>
<p>The following form will allow you to rework or edit a news item on the News and Events system. Please be aware that by reworking this news item you are changing it on every site that it will be published on. If you would like to control the placement of this news item, please choose the 'control placement' button from the manage news items menu.</p>

<cfif getnews.pubdate GTE #now()# or getnews.pulldate LTE #now()#>
	<p><strong>This article is inactive because of its date.</strong></p>
</cfif>

	<cfoutput>
		<form action="news_rework_preview.cfm" method="post" enctype="multipart/form-data" name="news_add" id="news_add">				
			
			<table class="tabulargrey">
				<tr>
					<td>Publish Date:
<a href="javascript:cal1.popup();"><img src="../scripts/cal.gif" width="16" height="16" border="0" alt="Click Here to Pick up the timestamp"></a><br/>
					<input type="Text" name="pubdate" value="#dateformat(getnews.pubdate, "mm/dd/yyyy")#"><br/>
<br/>
Pull Date:<a href="javascript:cal2.popup();"><img src="../scripts/cal.gif" width="16" height="16" border="0" alt="Click Here to Pick up the timestamp"></a><br/>
					<input type="text" name="pulldate" value="#dateformat(getnews.pulldate, "mm/dd/yyyy")#"><br/>
<br/>
Short Title:(#application.short# characters)<br/>
					<input type="text" name="shorttitle" size="50" maxlength="#application.short#" class="form" value="#getnews.shorttitle#"><br/>
<br/>
Long Title:(#application.long# characters)<br/>
					<input type="text" name="longtitle" size="50" maxlength="#application.long#" class="form" value="#getnews.longtitle#"><br/>
<br/>
Byline<br/>
					<input type="text" name="byline" size="50" maxlength="100" class="form" value="#getnews.byline#"><br/>
<br/>
Byline Title<br/>
					<input type="text" name="bylinetitle" size="50" maxlength="100" class="form" value="#getnews.bylinetitle#"><br/>
<br/>
Dateline<br/>
					<input type="text" name="dateline" size="50" maxlength="100" class="form" value="#getnews.dateline#"><br/>
<br/>
Description:<br/>
					<textarea cols="45" rows="5" name="description" class="form">#getnews.desc_clob#</textarea><br/>
<br/>
Content:<br/>
					<textarea cols="45" rows="15" name="content" class="form">#getnews.content2#</textarea><br/>
<br/>
</td>
					<cfif #application.newsimage# is 1>	<td valign="top">	&nbsp;					
											
						<cfif fileexists('#application.dir#\public\images\#url.newsid#.jpg')><a href="##" onClick="window.open('../public/images/#url.newsid#.jpg', 'mywindow', 'width=640,height=480,scrollbars=yes,resizable=yes')"><img src="../public/images/#url.newsid#.jpg" alt="" width="50" height="50" border="0"></a><br/>
<br/>
<a href="news_picturedelete.cfm?id=#url.newsid#">delete picture</a>
						<cfelse>
To upload a file for display with the news item please identify it by clicking on browse below:<br/>
For more information on how to do this click here.<br/>
							<input type="file" name="image">
						</cfif>
					</td></cfif>
				</tr>
			</table>
			<input type="submit" value="preview" class="button">
			<input type="hidden" name="newsid" value="#getnews.newsid#">
			<input type="hidden" name="userid" value="#getnews.userid#">
			<input type="hidden" name="notify" value="#getnews.userid#">
		</form>
<script language="JavaScript">
<!-- // create calendar object(s) just after form tag closed
			 // specify form element as the only parameter (document.forms['formname'].elements['inputname']);
			 // note: you can have as many calendar objects as you need for your application
			var cal1 = new calendar2(document.forms['news_add'].elements['pubdate']);
			cal1.year_scroll = true;
			cal1.time_comp = false;
			var cal2 = new calendar2(document.forms['news_add'].elements['pulldate']);
			cal2.year_scroll = true;
			cal2.time_comp = false;
		//-->
</script>
	</cfoutput>
	
<cfinclude template="../templates_new/footer.cfm">

