<cfinclude template="../templates/top.cfm">

<cfquery name="updatenews" datasource="#application.datasource_update#">
		update     CUNVMCS.events_ref
SET       events_ref_level=2
where event_refid=#form.event_refid#
</cfquery>
<div id="content">	

	<div id="currentFeature">
		<h2>Event Published</h2>
<div id="feed"><p><br/>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br/><br/><cfoutput><strong>"#form.shortdesc#" has been published to #form.site_name# site.</strong></cfoutput></p></div>



	
</div></div>
<cfinclude template="../templates/access_sidebar.cfm">

<cfinclude template="../templates/footer.cfm">
<cfinclude template="../templates/globalnav.cfm">
<!--- <cfinclude template="../templates/news_sortnav.cfm">
	
	<cfinclude template="../templates/search.cfm"> --->
<cfinclude template="../templates/events_adminnav.cfm">

</body>
</html>
