		
	<cfif parameterexists(url.date)>	
	<cfset now=createodbcdate(url.date)>
	<cfelse>
		<cfset now=createodbcdate(now())>
	</cfif>
<cfinclude template="siteids.cfm">
<cfinclude template="/newsevents/public/skins/focus/top.cfm">
	<cfoutput>
<h2 style="font-weight: bold;font-size:.85em;">#dateformat(now,"mmmm d, yyyy")#</h2>
		<cfif HTTP_REFERER contains 'generate'>
			<p>If you are unable to view this e-mail, please <a href="http://www.luc.edu/focus/">click on this link</a>. Or, find this week's <em>Loyola Focus</em> in <a href="http://www.luc.edu/locus">LOCUS student news</a>.</p>
		<cfelse>
			<p>Look for this week's <em>Loyola Focus</em> news in <a href="http://www.luc.edu/locus">LOCUS student news</a> as well.</p>
		</cfif>
		<!---<p>Also, visit Loyola's official <a href="http://www.myspace.com/loyolauniversitychicago">MySpace</a> and <a href="http://www.facebook.com/pages/Chicago-IL/Loyola-University-Chicago/29464444855">Facebook</a> profiles.</p>--->
	</cfoutput>
<div style="border: .05em #939393 solid;width:15em;background-color: #eeb111;padding:1.5em;margin:3em 1em;float:right;"><cfoutput><a href="#application.url#/public/news_submit.cfm?skin=focus">To suggest a news item or event for <em>Loyola Focus</em>, please click here and fill out the form.</a></cfoutput></div>	
<h3 style="font-size: .82em;font-weight: bold;margin-bottom:1em;text-transform: none;">IN THIS ISSUE:</h3>

<cfset site_id=#tn_id#>
<cfset title='TOP NEWS'>
<cfinclude template="ssi/emailchannel.cfm">

<cfset site_id=#ac_id#>
<cfset title='ACADEMICS'>
<cfinclude template="ssi/emailchannel.cfm">


<cfset site_id=#twe_id#>
<cfset title='THIS WEEK&rsquo;S EVENTS AND DEADLINES'>
<cfinclude template="ssi/emailchannel.cfm">

<cfset site_id=#ue_id#>
<cfset title='UPCOMING EVENTS'>
<cfinclude template="ssi/emailchannel.cfm">


<cfset site_id=#etc_id#>
<cfset title='ETC.'>
<cfinclude template="ssi/emailchannel.cfm">

<hr>

<cfset site_id=#tn_id#>
<cfset title='Top News'>
<cfinclude template="ssi/blurbchannel.cfm">

<cfset site_id=#ac_id#>
<cfset title='Academics'>
<cfinclude template="ssi/blurbchannel.cfm">

<cfset site_id=#twe_id#>
<cfset title='This Week&rsquo;s Events and Deadlines'>
<cfinclude template="ssi/blurbchannel.cfm">



<cfset site_id=#ue_id#>
<cfset title='Upcoming Events'>
<cfinclude template="ssi/blurbchannel.cfm">


<cfset site_id=#etc_id#>
<cfset title='Etc.'>
<cfinclude template="ssi/blurbchannel.cfm">
<cfinclude template="/newsevents/public/skins/focus/bottom.cfm">
