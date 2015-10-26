
<cfinclude template="/newsevents/templates/securityheader.cfm">

<!--- setting up image upload --->
<cfif #application.newsimage# is 1>
<Cfset randnum='#RandRange(100000, 10000000)#'>
<cfif parameterexists (form.image) and form.image is not ''>
	<cffile action="UPLOAD" filefield="image" destination="#root_dir#\public\images\" nameconflict="MAKEUNIQUE">
	<cffile action="RENAME" source="#application.dir#\public\images\#serverfile#" destination="#root_dir#\public\images\#randnum#.jpg">
<cfelse>
	<Cfset randnum='none'>
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



<cfset page='news'>
<cfset sort='no'>
<cfinclude template="/newsevents/templates_new/top.cfm">


<h2>Preview Article</h2>
<p>The news item that you reworked will be displayed as follows. If you have any changes, please  click on the 'back' button at the bottom of the screen. If everything is correct, please continue by clicking on the 'upload to site' button.</p>
<cfinclude template="../templates_new/news_layout.cfm">

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
</cfif>


<table width="100%" bgcolor="##FAF1C3" style="clear: left; background: ##FAF1C3 url(http://www.digital-web.com/images/yellow_arrow.gif) left no-repeat;">
<tr>
	<td align="right"><input type="button" value="rework" class="button" onClick="history.go(-1)"> <input class="button" type="submit" value="save changes"> </td>
</tr>
</table>
<input type="hidden" name="newsid" value="#form.newsid#">
<input type="hidden" name="notify" value="#form.userid#"></form></cfoutput>



<cfinclude template="/newsevents/templates_new/footer.cfm">