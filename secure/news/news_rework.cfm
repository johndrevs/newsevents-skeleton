



<cfquery name="getnews" datasource="#application.datasource_select#">
select news.newsid, shorttitle,longtitle,desc_clob,content_clob,content_clob2,byline,bylinetitle, dateline,pubdate,pulldate,userid,image_link,article_link,link_override
from CUNVMCS.news
where	news.newsid=#url.newsid#
</cfquery>


<cfdump var="#getnews#">

<cfset page='news'>
<cfset sort='no'>
<cfinclude template="/newsevents/secure/templates/top.cfm">

<h2>Rework News Item</h2>
<p>The following form will allow you to rework or edit a news item on the News and Events system. Please be aware that by reworking this news item you are changing it on every site that it will be published on. If you would like to control the placement of this news item, please choose the 'control placement' button from the manage news items menu.</p>

<cfif getnews.pubdate GTE #now()# or getnews.pulldate LTE #now()#>
	<p><strong>This article is inactive because of its date.</strong></p>
</cfif>

	<cfoutput>

		<form action="news_rework_preview.cfm" method="post" enctype="multipart/form-data" name="news_add" id="news_add">				
			
			<table cellpadding="5" cellspacing="0" border="0" summary="News Submission Form" class="tabulargrey">
		<tr>
			<td colspan="2" style="border-bottom: 1px solid ##999;padding:3px;background-color:##CCC;font-weight:bold;">News Item Details</th>
		</tr>
		<tr>
			<td colspan="2"><span class="maroon">*</span>= required field</td>
		</tr>
		<tr>
			<tr>
				<td><span class="maroon">*</span>Publish Date:</td>
				<td>			
			<cfset field='pubdate'>
			<cfinclude template="/newsevents/secure/templates/datedropdown.cfm"></td>
			</tr>
			<tr>
				<td><span class="maroon">*</span>Pull Date:</td>
				<td>			
			<cfset field='pulldate'>
			<cfinclude template="/newsevents/secure/templates/datedropdown.cfm"></td>
			</tr>
			<tr>
				<td><span class="maroon">*</span>Short Title:(#application.short# characters)</td>
				<td>
				<input type="text" name="shorttitle" value="#getnews.shorttitle#" size="50" maxlength="#application.short#" class="form"></td>
			</tr>
			<tr>
				<td>Long Title:(#application.long# characters)</td>
				<td>
				<input type="text" name="longtitle" value="#getnews.longtitle#" size="50" maxlength="#application.long#" class="form"></td>
			</tr>
			<tr>
				<td>Byline</td>
				<td>
				<input type="text" name="byline" value="#getnews.byline#" size="50" maxlength="100" class="form"></td>
			</tr>
			<tr>
				<td>Byline Title</td>
				<td>
				<input type="text" name="bylinetitle" value="#getnews.bylinetitle#" size="50" maxlength="100" class="form"></td>
			</tr>
			<tr>
				<td>Dateline</td>
				<td>
				<input type="text" name="dateline" value="#getnews.dateline#" size="50" maxlength="100" class="form"></td>
			</tr>
			<tr>
				<td colspan="2">Description:
				<br/>
				<textarea cols="45" rows="5" name="description" class="form">#getnews.desc_clob#</textarea></td>
			</tr>
			<tr>
				<td colspan="2">Content:
				<br/>
				<textarea cols="45" rows="15" name="content" class="form">#getnews.content_clob##getnews.content_clob2#</textarea></td>
			</tr>
			<tr>
						
			<cfif #application.newsimage# is 1>	<td colspan="2" valign="top">	&nbsp;					
											
						<cfif fileexists('#application.dir#/public/images/#url.newsid#.jpg')><a href="##" onClick="window.open('/newsevents/public/images/#url.newsid#.jpg', 'mywindow', 'width=640,height=480,scrollbars=yes,resizable=yes')"><img src="/newsevents/public/images/#url.newsid#.jpg" alt="#getnews.shorttitle#" border="0"></a><br/>
<br/>
<a href="news_picturedelete.cfm?id=#url.newsid#">delete picture</a>
						<cfelse>
To upload a file for display with the news item please identify it by clicking on browse below:<br/>
For more information on how to do this click here.<br/>
							<input type="file" name="image">
						</cfif>
					</td><cfelseif #application.newsimage# is 2>
			<td>Image Link:</td><td><input type="text" value="#getnews.image_link#" name="image_link" size="50" maxlength="150" class="form"></td></cfif></tr>
		<tr>
				<td>Article Link</td>
				<td><input type="text" value="#getnews.article_link#" name="article_link" size="50" maxlength="150" class="form"></td>
			</tr>
		<tr><td colspan="2">Would you like the News Item Website to be the detail page for your news item?<!--(will create event as a link to page)-->&nbsp;&nbsp;<input type="radio" name="link_override" value="1" <cfif getnews.link_override EQ 1>checked</cfif>>yes&nbsp;&nbsp;<input type="radio" name="link_override" value="0" <cfif getnews.link_override NEQ 1>checked</cfif>>no</td></tr>
		
		
	</table>

			<input type="submit" value="preview" class="button">
			<input type="hidden" name="newsid" value="#getnews.newsid#">
			<input type="hidden" name="userid" value="#getnews.userid#">
			<input type="hidden" name="notify" value="#getnews.userid#">
		</form>
<script language="JavaScript">
// initialization block for all calendars on the page
// A_CALENDARS array contains references to each calendar instance
for (var n = 0; n < A_CALENDARS.length; n++) {
	A_CALENDARS[n].create();
}
</script>
	</cfoutput>
	
<cfinclude template="../templates/footer.cfm">

