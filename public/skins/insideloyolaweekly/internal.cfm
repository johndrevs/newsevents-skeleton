<cfif isdefined("url.aud")>
	<cfset aud=url.aud>
 <cfelse>
 	<cfset aud=0>
 </cfif>

<cfquery name="getnews" datasource="#application.datasource_select#">
select content_clob,content_clob2, pubdate, pulldate, shorttitle, bylinetitle,dateline, news.newsid, longtitle,DESC_CLOB,created,byline,image_link,link_override,article_link
from CUNVMCS.news
where newsID=#url.newsid#
</cfquery>
<cfset temp = "#getnews.content_clob##getnews.content_clob2#">
<cfset temp2 = replace(temp,chr(13)&chr(10)&chr(13)&chr(10),"<p>","all")>
<cfset temp3 = replace(temp2,chr(13)&chr(10),"<br/>","all")>
<cfset temp4 = replace(temp3,chr(32)&chr(32)&chr(32),"&nbsp;&nbsp;&nbsp;","all")>
<cfset FormatBody= replace(temp4,chr(9),"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;","all")>
<cfset description="#getnews.DESC_CLOB#">
<cfset pubdate="#getnews.pubdate#">
<cfset pulldate="#getnews.pulldate#">
<cfset longtitle="#getnews.longtitle#">
<cfset shorttitle="#getnews.shorttitle#">
<cfset byline="#getnews.byline#">
<cfset bylinetitle="#getnews.bylinetitle#">
<cfset dateline="#getnews.dateline#">
<cfset content="#getnews.content_clob#">
<cfset image_link="#getnews.image_link#">
<cfset article_link="#getnews.article_link#">
<cfset link_override="#getnews.link_override#">		
	<cfif isDefined("url.siteid")>	
	<cfset url.siteid=#url.siteid#>
	<cfelse>
		<cfset url.siteid=0>
	</cfif>
<cfquery datasource="#application.datasource_select#" name="getpublication">
SELECT site_name
FROM CUNVMCS.sites
where siteid=#url.siteid#
</cfquery>

<cfinclude template="top.cfm">
					<div style="font-size: 13px; padding:5px 15px;">
						<cfoutput>
							<cfif variables.shorttitle eq variables.longtitle or variables.longtitle is ''>
								<h3>#variables.shorttitle#</h3>							
							<cfelseif variables.shorttitle is ''>
								<h3>#variables.longtitle#</h3>
							<cfelse>
								<h3>#variables.longtitle#</h3>
							</cfif>
							<cfif isDefined("getnews.newsid") and  fileexists('#application.dir#/public/images/#getnews.newsid#.jpg')><img src="/newsevents/public/images/#getnews.newsid#.jpg" alt="#shorttitle#" class="copyimage_l"/>							
							<cfelseif  variables.image_link neq ''><img src="#variables.image_link#" alt="#variables.shorttitle#" border="0">
							</cfif>
							<p>#variables.FormatBody#</p>
						</cfoutput>
				</td>
			<td rowspan="2" valign="top" bgcolor="#c8c8c8" width="240" style="font-size: 10px">				
				<div id="links" style="margin-top:15px;padding:0 13px;text-align:left;">
					<cfoutput>
<a href="email.cfm?date=#dateformat(now, "mm/dd/yyyy")#" style="color: ##a30046;text-decoration:none;font-size: 12.5px;"><em>Inside Loyola Weekly</em> Home</a>
					</cfoutput>
					<hr>				
				<cfset site_id=#importantinfo_id#>
					<h3 style="color: #686868;font-size: 13px;">TOP STORIES</h3>
				<cfinclude template="ssi/ul.cfm">
				<cfset site_id=#leadsubs_id#>
					<h3 style="color: #686868;font-size: 13px;">FEATURED EVENTS</h3>				
				<cfset site_id=#upcomingevents_id#>
				<cfinclude template="ssi/upcomingevents.cfm">
				<cfinclude template="ssi/ul.cfm">
<hr><cfoutput><a href="http://#cgi.server_name#/newsevents/public/news_submit.cfm?skin=il" style="color: ##a30046;text-decoration:none;font-size: 12.5px;">To suggest a news item or event for <em>Inside Loyola Weekly</em>, please click here.</a></cfoutput>
				</div>
			<cfinclude template="bottom.cfm">
            <cfif isdefined("url.aud") and url.aud eq 'f'>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/yui/2.8.0r4/build/yahoo/yahoo-min.js"></script> 
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/yui/2.8.0r4/build/cookie/cookie-min.js"></script> 
<script type="text/javascript">
YAHOO.util.Cookie.set("audience", "Faculty", {expires: new Date("January 12, 2025"),domain: ".luc.edu", path: "/"});
<cfoutput>pageTracker._trackEvent('Audience', 'Set', 'IL Weekly#dateformat(now(),"mmddyy")#');</cfoutput>
pageTracker._setVar("Faculty");
</script>
<cfelseif isdefined("url.aud") and url.aud eq 's'>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/yui/2.8.0r4/build/yahoo/yahoo-min.js"></script> 
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/yui/2.8.0r4/build/cookie/cookie-min.js"></script> 
<script type="text/javascript">
YAHOO.util.Cookie.set("audience", "Staff", {expires: new Date("January 12, 2025"),domain: ".luc.edu", path: "/"});
<cfoutput>pageTracker._trackEvent('Audience', 'Set', 'IL Weekly#dateformat(now(),"mmddyy")#');</cfoutput>
pageTracker._setVar("Staff");
</script>
</cfif>
