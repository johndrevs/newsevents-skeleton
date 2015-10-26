<cfset public=1>


<!--- setting up image upload --->		
	<cfif #application.newsimage# is 1>		
		<cfset randnum='#RandRange(100000, 1000000)#'>			
		<cfif form.image is not''>
	
			<cffile action="UPLOAD" filefield="image" destination="#application.dir#/public/images/" nameconflict="MAKEUNIQUE" attributes="Normal">
			<cffile action="RENAME" source="#application.dir#/public/images/#serverfile#" destination="#application.dir#/public/images/#randnum#.jpg"> 
		<cfelse>
			<cfset randnum='none'>
		</cfif>
		<cfset image="#randnum#">
	<cfelseif #application.newsimage# is 2>		
	<cfset image_link="#form.image_link#">
	</cfif>
<!--- end image upload --->	

	<cfset temp = "#form.content#">	
	<cfset temp2 = replace(temp,chr(13)&chr(10)&chr(13)&chr(10),"<p>","all")>	
	<cfset temp3 = replace(temp2,chr(13)&chr(10),"<br/>","all")>	
	<cfset temp4 = replace(temp3,chr(32)&chr(32)&chr(32),"&nbsp;&nbsp;&nbsp;","all")>	
	<cfset FormatBody= replace(temp4,chr(9),"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;","all")>	
	<cfset description="#form.description#">	
	<cfset pubdate=#CreateDateTime(form.pubdate_year, form.pubdate_month, form.pubdate_day, 1, 00, 00)#>
<cfset pulldate=#CreateDateTime(form.pulldate_year, form.pulldate_month, form.pulldate_day, 23, 00, 00)#>
	<cfset longtitle="#form.longtitle#">	
	<cfset shorttitle="#form.shorttitle#">	
	<cfset byline="#form.byline#">	
	<cfset bylinetitle="#form.bylinetitle#">	
	<cfset dateline="#form.dateline#">	
	<cfset content="#form.content#">
	
	<cfset article_link="#form.article_link#">			
	<cfset link_override="#form.link_override#">	
	<cfif isdefined("form.post") or isdefined("form.publish")>			
		<cfif isdefined("form.post")>			
			<cfset post="#form.post#">
		</cfif>
		<cfif isdefined("form.publish")>			
			<cfset publish="#form.publish#">
		</cfif>
	<cfelse>You must choose at least one site to post to.
		<cfabort>
	</cfif>
	
<cfset page='news'>
<cfset sort='no'>



<cfif parameterexists(url.skin) and url.skin eq 'il'><cfinclude template="/newsevents/public/skins/insideloyolaweekly/top.cfm"><h3>Submit a News Item</h3><cfelseif parameterexists(url.skin) and url.skin eq 'focus'><cfinclude template="/newsevents/public/skins/focus/top.cfm"><h3>Submit a News Item</h3><cfelse><cfinclude template="/newsevents/public/ssi/header_61807.cfm"><h2>Submit a News Item</h2></cfif>
<p>The news item that you entered will be displayed as follows. If you have any changes, please  click on the 'back' button at the bottom of the screen. If everything is correct, please continue by clicking on the 'upload to site' button.</p>
		<cfinclude template="/newsevents/secure/templates/news_layout.cfm">
		
		<cfoutput>
			<form action="news_add_action.cfm<cfif parameterexists(url.skin) and url.skin eq 'il'>?skin=il<cfelseif parameterexists(url.skin) and url.skin eq 'focus'>?skin=focus<cfelse></cfif>" method="post">
				<input type="hidden" name="description" value="#htmleditformat(variables.description)#">
				<input type="hidden" name="pubdate" value="#variables.pubdate#">
				<input type="hidden" name="pulldate" value="#variables.pulldate#">
				<input type="hidden" name="longtitle" value="#replace(variables.longtitle, chr(34), "*", "ALL")#">
				<input type="hidden" name="shorttitle" value="#replace(variables.shorttitle, chr(34), "*", "ALL")#">
				<input type="hidden" name="byline" value="#variables.byline#">
				<input type="hidden" name="bylinetitle" value="#variables.bylinetitle#">
				<input type="hidden" name="dateline" value="#variables.dateline#">
				<input type="hidden" name="content" value="#htmleditformat(form.content)#">
				<input type="hidden" name="article_link" value="#variables.article_link#">
				<input type="hidden" name="link_override" value="#variables.link_override#">					
				<cfif #application.newsimage# is 1>
					<input type="hidden" name="image" value="#variables.image#">
				<cfelseif #application.newsimage# is 2>		
				<input type="hidden" name="image_link" value="#variables.image_link#">
				</cfif>
									<cfif isdefined("form.post")>
					<input type="hidden" name="post" value="#variables.post#">
				</cfif>
									<cfif isdefined("form.publish")>
					<input type="hidden" name="publish" value="#variables.publish#">
				</cfif>
				<cfif isDefined("variables.public") and variables.public EQ 1>
				<input type="hidden" name="userid" value="85">
				
			<cfelse>
				<input type="hidden" name="userid" value="#session.userid#">
				
			</cfif>
				<table width="100%" bgcolor="##FAF1C3" style="clear: left; background: ##FAF1C3 url(images/yellow_arrow.gif) left no-repeat;">
					<tr>
						<td align="right">
						<input type="submit" class="button" value="upload to site">
						<input type="button" value="back" class="button" onClick="history.go(-1)"></td>
					</tr>
				</table>
			</form>
		</cfoutput>


<cfif parameterexists(url.skin) and url.skin eq 'il'><cfinclude template="/newsevents/public/skins/insideloyolaweekly/bottom.cfm"><cfelseif parameterexists(url.skin) and url.skin eq 'focus'><cfinclude template="/newsevents/public/skins/focus/bottom.cfm"><cfelse>
<cfinclude template="/newsevents/public/ssi/footer_61807.cfm">	</cfif>