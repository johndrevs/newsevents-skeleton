
<cfinclude template="/newsevents/templates/securityheader.cfm">
	
	<cfquery name="getpublish" datasource="#application.datasource_select#">
		SELECT SITES.SITE_NAME, SITES.SITEID
		FROM CUNVMCS.SITES
		WHERE sites.isactive =1 and sites.siteid IN (#session.publish#)
	</cfquery>
	<cfquery name="getpost" datasource="#application.datasource_select#">
		SELECT SITES.SITE_NAME, SITES.SITEID
		FROM CUNVMCS.SITES
		WHERE  sites.isactive =1 and sites.siteid IN (#session.post#)
	</cfquery>
	

<cfset page='news'>
<cfset sort='no'>
<cfinclude template="/newsevents/templates_new/top.cfm">	
	
<h2>New News Item</h2>
<p>The following form will allow you to add a news item into the News and Events system. Please fill out the form completely with as much information as possible. Once your article has been added to the system you will be be able to control its placement on sites from the manage news items link to the left. For an example layout of how each of these fields will be presented, <a href="##" onClick="window.open('news_examplelayout.cfm','mywindow','width=640,height=480,scrollbars=yes,resizable=yes')">please click here</a>.</p>

	<cfoutput>
		<form action="news_add_preview.cfm" method="post" enctype="multipart/form-data" name="news_add" id="news_add">
			<table class="tabulargrey">
				<tr>
					<td>Publish Date*:
<a href="javascript:cal1.popup();"><img src="../scripts/cal.gif" width="16" height="16" border="0" alt="Click Here to Pick up the timestamp"></a><br/>
					<input type="Text" name="pubdate"><br/>
<br/>
Pull Date*:<a href="javascript:cal2.popup();"><img src="../scripts/cal.gif" width="16" height="16" border="0" alt="Click Here to Pick up the timestamp"></a><br/>
					<input type="text" name="pulldate"><br/>
<br/>
Short Title*:(#application.short# characters)<br/>
					<input type="text" name="shorttitle" size="50" maxlength="#application.short#" class="form"><br/>
<br/>
Long Title:(#application.long# characters)<br/>
					<input type="text" name="longtitle" size="50" maxlength="#application.long#" class="form"><br/>
<br/>
Byline<br/>
					<input type="text" name="byline" size="50" maxlength="100" class="form"><br/>
<br/>
Byline Title<br/>
					<input type="text" name="bylinetitle" size="50" maxlength="100" class="form"><br/>
<br/>
Dateline<br/>
					<input type="text" name="dateline" size="50" maxlength="100" class="form"><br/>
<br/>
Description:<br/>
					<textarea cols="45" rows="5" name="description" class="form"></textarea><br/>
<br/>
Content:<br/>
					<textarea cols="45" rows="15" name="content" class="form"></textarea><br/>
<br/>
</td>
					<td valign="top">						
					<cfif getpublish.recordcount gt 0><a href="#variables.location#?showdef=yes">Publish</a> Article to:<br/>
						<select name="publish" size="3" multiple>
							<cfloop query="getpublish">
								<option value="#siteid#">#site_name#</option>
							</cfloop>
						</select><br/><br/>
					<cfelse>
You do not currently have access to publish to any sites<br/><br/>
					</cfif>
					<cfif getpost.recordcount gt 0><a href="#variables.location#?showdef=yes">Post</a> Article to:<br/>
						<select name="post" size="3" multiple>
							<cfloop query="getpost">
								<option value="#siteid#">#site_name#</option>
							</cfloop>
						</select><br/><br/>
					<cfelse>
You do not currently have access to post to any sites<br/><br/>
					</cfif>
					<cfif #application.newsimage# is 1>To upload a file for display with the news item please identify it by clicking on browse below:<br/>
For more information on how to do this click here.<br/>
						<input type="file" name="image">
					</cfif></td>
				</tr>
			</table>

			<input type="submit" value="preview" class="button">
		</form>


<script language="JavaScript"><!-- // create calendar object(s) just after form tag closed
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

<cfinclude template="/newsevents/templates_new/footer.cfm">