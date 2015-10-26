
<cfinclude template="/newsevents/templates/securityheader.cfm">

<!--- setting up image upload --->		
	<cfif #application.newsimage# is 1>		
		<cfset randnum='#RandRange(100000, 1000000)#'>			
		<cfif form.image is not''>
			<cffile action="UPLOAD" filefield="image" destination="#application.dir#\public\images\" nameconflict="MAKEUNIQUE">
			<cffile action="RENAME" source="#application.dir#\public\images\#serverfile#" destination="#application.dir#\public\images\#randnum#.jpg">
		<cfelse>
			<cfset randnum='none'>
		</cfif>
		<cfset image="#randnum#">
	</cfif>
<!--- end image upload --->	

	<cfset temp = "#form.content#">	
	<cfset temp2 = replace(temp,chr(13)&chr(10)&chr(13)&chr(10),"<p>","all")>	
	<cfset temp3 = replace(temp2,chr(13)&chr(10),"<br/>","all")>	
	<cfset temp4 = replace(temp3,chr(32)&chr(32)&chr(32),"&nbsp;&nbsp;&nbsp;","all")>	
	<cfset FormatBody= replace(temp4,chr(9),"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;","all")>	
	<cfset description="#form.description#">	
	<cfset pubdate="#form.pubdate#">	
	<cfset pulldate="#dateadd("h",23, form.pulldate)#">	
	<cfset longtitle="#form.longtitle#">	
	<cfset shorttitle="#form.shorttitle#">	
	<cfset byline="#form.byline#">	
	<cfset bylinetitle="#form.bylinetitle#">	
	<cfset dateline="#form.dateline#">	
	<cfset content="#form.content#">
			
	<cfif isdefined("form.post") or isdefined("form.publish")>			
		<cfif isdefined("form.post")>			
			<cfset post="#form.post#">
		</cfif>
		<cfif isdefined("form.publish")>			
			<cfset publish="#form.publish#">
		</cfif>
	<cfelse>You must choose at least one site to post or publish to.
		<cfabort>
	</cfif>
	
<cfset page='news'>
<cfset sort='no'>
<cfinclude template="/newsevents/templates_new/top.cfm">	

<h2>Preview News Item</h2>
<p>The news item that you entered will be displayed as follows. If you have any changes, please  click on the 'back' button at the bottom of the screen. If everything is correct, please continue by clicking on the 'upload to site' button.</p>
		<cfinclude template="/newsevents/templates_new/news_layout.cfm">
		
		<cfoutput>
			<form action="news_add_action.cfm" method="post">
				<input type="hidden" name="description" value="#variables.description#">
				<input type="hidden" name="pubdate" value="#variables.pubdate#">
				<input type="hidden" name="pulldate" value="#variables.pulldate#">
				<input type="hidden" name="longtitle" value="#replace(variables.longtitle, chr(34), "*", "ALL")#">
				<input type="hidden" name="shorttitle" value="#replace(variables.shorttitle, chr(34), "*", "ALL")#">
				<input type="hidden" name="byline" value="#variables.byline#">
				<input type="hidden" name="bylinetitle" value="#variables.bylinetitle#">
				<input type="hidden" name="dateline" value="#variables.dateline#">
				<input type="hidden" name="content" value="#htmleditformat(form.content)#">					
				<cfif #application.newsimage# is 1>
					<input type="hidden" name="image" value="#variables.image#">
				</cfif>
									<cfif isdefined("form.post")>
					<input type="hidden" name="post" value="#variables.post#">
				</cfif>
									<cfif isdefined("form.publish")>
					<input type="hidden" name="publish" value="#variables.publish#">
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

<cfinclude template="../templates_new/footer.cfm">
