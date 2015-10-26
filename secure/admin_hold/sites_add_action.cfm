
<cfquery name="insert_sites" datasource="#application.datasource_update#">
			INSERT INTO CUNVMCS.sites(isactive,site_name,uri,maxrows,creator,description)
				VALUES(1,'#form.site_name#','#form.url#',#form.maxrows#,#session.userid#,1)
		</cfquery>
		
		<cflocation url="sites_list.cfm" addtoken="No">