<cfinclude template="/newsevents/templates/securityheader.cfm">

<cfquery name="updatenews" datasource="#application.datasource_update#">
		update     CUNVMCS.news_ref
SET       news_ref_level=2
where news_refid=#form.news_refid#
</cfquery>
	

	
		<h2>News Item Published</h2>
<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br/><br/><cfoutput><strong>"#form.shorttitle#" has been published to #form.site_name# site.</strong></cfoutput></p>



	



</body>
</html>
