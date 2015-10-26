	<cfquery name="getpublish" datasource="#application.datasource_select#">
		SELECT SITES.SITE_NAME, SITES.SITEID
		FROM CUNVMCS.SITES
		WHERE sites.isactive =1 and sites.siteid IN (#session.publish#)
		order by site_name
	</cfquery>
	<cfquery name="getpost" datasource="#application.datasource_select#">
		SELECT SITES.SITE_NAME, SITES.SITEID
		FROM CUNVMCS.SITES
		WHERE  sites.isactive =1 and sites.siteid IN (#session.post#)
		order by site_name
	</cfquery>
	

<cfset page='news'>
<cfset sort='no'>

<cfinclude template="/newsevents/secure/templates/top.cfm">	
	
<h2>Add News Item</h2>
<p>The following form will allow you to add a news item into the News and Events system. Please fill out the form completely with as much information as possible. Once your article has been added to the system you will be be able to control its placement on sites from the manage news items link to the left. For an example layout of how each of these fields will be presented, <a href="##" onClick="window.open('news_examplelayout.cfm','mywindow','width=640,height=480,scrollbars=yes,resizable=yes')">please click here</a>.</p>


		<cfset public=1>
	<cfinclude template="/newsevents/secure/templates/news_form.cfm">
			



	

<cfinclude template="/newsevents/secure/templates/footer.cfm">