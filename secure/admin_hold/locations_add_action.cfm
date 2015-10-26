<cfquery name="insert_locations" datasource="#application.datasource_update#">
			INSERT INTO CUNVMCS.locations(isactive,location_name,address,subaddress,location_link,creator)
				VALUES('1','#form.location_name#','#form.address#','#form.subaddress#','#form.location_link#','#session.userid#' )
		</cfquery>
		
<cflocation url="locations_list.cfm" addtoken="No">