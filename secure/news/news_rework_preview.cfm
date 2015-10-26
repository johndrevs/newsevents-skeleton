


<!--- setting up image upload --->
<cfif #application.newsimage# is 1>
<Cfset randnum='#RandRange(100000, 10000000)#'>
<cfif isDefined("form.image") and form.image is not ''>
	<cffile action="UPLOAD" filefield="image" destination="#application.dir#/public/images/" nameconflict="MAKEUNIQUE" attributes="Normal">
			<cffile action="RENAME" source="#application.dir#/public/images/#serverfile#" destination="#application.dir#/public/images/#randnum#.jpg"> 
<cfelse>
	<Cfset randnum='none'>
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
<cfset description="#replace(variables.description, chr(34), "*", "ALL")#">
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


<cfset page='news'>
<cfset sort='no'>
<cfinclude template="/newsevents/secure/templates/top.cfm">


<h2>Preview Article</h2>
<p>The news item that you reworked will be displayed as follows. If you have any changes, please  click on the 'back' button at the bottom of the screen. If everything is correct, please continue by clicking on the 'upload to site' button.</p>
<cfinclude template="../templates/news_layout.cfm">

<cfoutput><form action="news_rework_action.cfm" method="post">
<input type="hidden" name="description" value="#variables.description#">
<input type="hidden" name="pubdate" value="#variables.pubdate#">
<input type="hidden" name="pulldate" value="#variables.pulldate#">
<input type="hidden" name="longtitle" value="#variables.longtitle#">
<input type="hidden" name="shorttitle" value="#variables.shorttitle#">
<input type="hidden" name="byline" value="#variables.byline#">
<input type="hidden" name="bylinetitle" value="#variables.bylinetitle#">
<input type="hidden" name="dateline" value="#variables.dateline#">
<input type="hidden" name="content" value="#htmleditformat(form.content)#">
<cfif #application.newsimage# is 1>
<input type="hidden" name="image" value="#variables.image#">
<cfelseif #application.newsimage# is 2>		
	<input type="hidden" name="image_link" value="#variables.image_link#">
</cfif>
<input type="hidden" name="article_link" value="#variables.article_link#">			
<input type="hidden" name="link_override" value="#variables.link_override#">	


<table width="100%" bgcolor="##FAF1C3" style="clear: left; background: ##FAF1C3 url(http://www.digital-web.com/images/yellow_arrow.gif) left no-repeat;">
<tr>
	<td align="right"><input type="button" value="rework" class="button" onClick="history.go(-1)"> <input class="button" type="submit" value="save changes"> </td>
</tr>
</table>
<input type="hidden" name="newsid" value="#form.newsid#">
<input type="hidden" name="notify" value="#form.userid#"></form></cfoutput>



<cfinclude template="/newsevents/secure/templates/footer.cfm">