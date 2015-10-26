<cfif isdefined("url.aud")>
	<cfset aud=url.aud>
 <cfelse>
 	<cfset aud=0>
 </cfif>		
	<cfif parameterexists(url.date)>	
	<cfset now=createodbcdate(url.date)>
	<cfelse>
		<cfset now=createodbcdate(now())>
	</cfif>
<cfinclude template="siteids.cfm">

<cfinclude template="top.cfm">
	<div class="yui-g" id="leads" style="font-size: 13px; padding:15px 25px 15px 15px; font-family:Georgia, Times, serif;">	
	<cfset site_id=#importantinfo_id#>
	<cfinclude template="ssi/importantinformation.cfm">
		<cfset site_id=#leadsubs_id#>
	<cfinclude template="ssi/ul.cfm">
	</div></td>
	<td width="240" rowspan="5" valign="top" bgcolor="#E8E8E8" style="font-size: 10px">		
	<cfif variables.image_link neq ''>
		<cfoutput>
<img src="#image_link#" alt="#image_alt#" width="240" height="228" border="0">
		</cfoutput>
	</cfif>
	<div id="links" style="margin-top:15px;padding:0 13px;text-align:left;">
		<h3 style="color: #686868;font-size: 13px;">FEATURED EVENTS</h3>	
	<cfset site_id=#upcomingevents_id#>
	<cfinclude template="ssi/upcomingevents.cfm">
	<cfinclude template="ssi/ul.cfm">
<cfoutput><img src="#application.url#/public/skins/insideloyolaweekly/calendar.gif" alt="" width="14" height="13" border="0" style="padding:0px 5px;margin:15px 0 -5px 0;"><a href="http://www.luc.edu/calendar" style="color: ##a30046;text-decoration:none;font-size: 12.5px;">Complete Events Calendar</a>
<hr style="margin:15px 0">
		
<a href="http://#cgi.server_name#/newsevents/public/news_submit.cfm?skin=il" style="color: ##a30046;text-decoration:none;font-size: 12.5px;">To suggest a news item or event for <em>Inside Loyola Weekly</em>, please click here.</a>
		</cfoutput>
	</div></td>
</tr>
	<tr>
		<td valign="top" align="left" width="45%" style="padding:5px 11px;">
		<div style="border-right: 1px #a5a5a5 solid;">
			<h3 style="text-transform: uppercase;color: #686868;font-size: 12px;font-weight: bold;margin-bottom:5px;">Media Spotlight</h3>		
		<cfset site_id=#lim_id#>
		<cfinclude template="ssi/dl.cfm">
		</div></td>
		<td valign="top" align="left" width="45%" style="padding:5px 12px;">
		<h3 style="text-transform: uppercase;color: #686868;font-size: 12px;font-weight: bold;margin-bottom:5px;">Kudos</h3>	
	<cfset site_id=#kudos_id#>
	
	<cfinclude template="ssi/dl.cfm">
	</td>
	</tr>
	<tr>
		<td colspan="2" valign="bottom" align="left" style="padding:5px 11px;">
		<p>&nbsp;</p>
		</td>
		</tr>
	<tr>
		<td colspan="2" valign="bottom" align="left" style="padding:5px 11px;">
		<p>&nbsp;</p>
		</td>
		</tr>
		<tr>
		<td colspan="2" valign="bottom" align="left" style="padding:5px 11px;">
		<p>&nbsp;</p>
	
	<cfinclude template="bottom.cfm">
