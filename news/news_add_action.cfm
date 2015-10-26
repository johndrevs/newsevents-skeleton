
	<cfif isdefined("form.post") or isdefined("form.publish")>
		<cflock timeout="20" throwontimeout="No" type="EXCLUSIVE">
		<cfquery name="insert_news" datasource="#application.datasource_update#">
			INSERT INTO CUNVMCS.news(lastmod,isactive,ispublic,created,pubdate,pulldate,shorttitle, longtitle, DESC_CLOB,byline,bylinetitle, dateline, content2,content,userid)
				VALUES(SYSDATE,1,1,SYSDATE,to_date ('#dateformat(form.pubdate, "yyyy/mm/dd")##timeformat(form.pubdate, "hh:mm:00")#', 'yyyy/mm/dd hh24:mi:ss'),to_date ('#dateformat(form.pulldate, "yyyy/mm/dd")##timeformat(form.pulldate, "hh:mm:00")#', 'yyyy/mm/dd hh24:mi:ss'),'#form.shorttitle#', '#form.longtitle#', '#form.description#','#form.byline#','#form.bylinetitle#', '#form.dateline#', '#form.content#','1',#session.userid#)
		</cfquery>
		<cfquery datasource="#application.datasource_select#" name="getID">
			SELECT MAX(newsID) as MaxID
			FROM CUNVMCS.news
		</cfquery>
		</cflock>
		
		<!--- upload image --->
		<cfif #application.newsimage# is 1>
	<cfif form.image is not 'none'>
		<cffile action="RENAME" source="D:\CFusionMX\wwwroot\NewsEvents\public\images\#form.image#.jpg" destination="D:\CFusionMX\wwwroot\NewsEvents\public\images\#getid.maxID#.jpg">
	</cfif>
	</cfif>
		
		
		assosciates publish			
		
		<cfif isdefined("form.post")>
			<cfloop list="#form.post#" index="n">
				<cfquery datasource="#application.datasource_update#" name="insertpost">
					INSERT INTO CUNVMCS.news_ref(newsID, siteID, actionDate,news_ref_level,userid)
					VALUES(#getid.maxID#, #n#, SYSDATE,1,#session.userid#)
				</cfquery>
			</cfloop>
		</cfif>
		
		<cfif isdefined("form.publish")>
			<cfloop list="#form.publish#" index="n">
				<cfquery datasource="#application.datasource_update#" name="insertpublish">
					INSERT INTO CUNVMCS.news_ref(newsID, siteID, actionDate,news_ref_level,userid)
					VALUES(#getid.maxID#, #n#, SYSDATE,2,#session.userid#)
				</cfquery>
			</cfloop>
		</cfif>
		
	<cfelse>
You must choose at least one site to post or publish to.
	</cfif>
inserts into new

<cflocation url="index.cfm" addtoken="No">