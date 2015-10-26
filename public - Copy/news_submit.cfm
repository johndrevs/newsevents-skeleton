
<cfquery name="getpost" datasource="#application.datasource_select#">
SELECT site_name, siteid, ispublic
FROM CUNVMCS.sites
where ispublic=1 and calendar=1 and isactive=1
order by site_name

</cfquery>

<cfquery name="getaudiences" datasource="#application.datasource_select#">
SELECT title,audienceid
from CUNVMCS.audiences
order by title
</cfquery>

<cfquery name="getlocations" datasource="#application.datasource_select#">
SELECT location_name,locationid
from CUNVMCS.locations
where locationid<>3 and isactive=1
order by location_name
</cfquery>

<cfif parameterexists(url.skin) and url.skin eq 'il'><cfinclude template="/newsevents/public/skins/insideloyolaweekly/top.cfm"><div class="yui-g" id="leads" style="font-size: 13px; padding:5px 15px; font-family:Georgia, Times, serif;">	<cfelseif parameterexists(url.skin) and url.skin eq 'focus'><cfinclude template="/newsevents/public/skins/LUFocus/ssi/top.cfm"><cfelse><cfinclude template="/newsevents/public/ssi/header_61807.cfm"></cfif>




<cfset public=0>
<cfinclude template="/newsevents/secure/templates/news_form.cfm">
<cfif parameterexists(url.skin) and url.skin eq 'il'></div><cfinclude template="/newsevents/public/skins/insideloyolaweekly/bottom.cfm"><cfelseif parameterexists(url.skin) and url.skin eq 'focus'></div></div>
<!-- sidebar start -->
<cfinclude template="/newsevents/public/skins/LUFocus/ssi/sidebar.cfm">
<!-- sidebar end -->

<cfinclude template="/newsevents/public/skins/LUFocus/ssi/bottom.cfm"><cfelse>
<cfinclude template="/newsevents/public/ssi/footer_61807.cfm">	</cfif>
