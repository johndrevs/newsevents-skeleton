<cfquery name="insert_sites" datasource="#application.datasource_update#">
			INSERT INTO CUNVMCS.messages(isactive,subject,content,date_sent,userid)
				VALUES(1,'#form.subject#','#form.content#',SYSDATE,#session.userid#)
		</cfquery>
		<cflocation url="messages_list.cfm" addtoken="No">