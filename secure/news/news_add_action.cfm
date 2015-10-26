		
<cfif len(form.content) gt 3999>
<cfset variables.content1=#RemoveChars(form.content, 4000, 400000)#>
<cfset variables.content2=#RemoveChars(form.content, 1, 3999)#>
<cfset variables.content2=#left(variables.content2, 4000)#>
<cfelse>
<cfset variables.content1=#form.content#>
<cfset variables.content2=' '>
</cfif>
	
	
	<cfif isdefined("form.post") or isdefined("form.publish")>
		<cflock timeout="20" throwontimeout="No" type="EXCLUSIVE">
		
<cfquery name="insert_news" datasource="#application.datasource_update#">
INSERT INTO CUNVMCS.news(lastmod,isactive,ispublic,created,pubdate,pulldate,shorttitle, longtitle,byline,bylinetitle, dateline,userid,<cfif #application.newsimage# is 2>image_link,</cfif>article_link,link_override)

VALUES(SYSDATE,1,1,SYSDATE,to_date ('#dateformat(pubdate, "yyyy/mm/dd")# #timeformat(pubdate, "HH:mm:ss")#', 'yyyy/mm/dd hh24:mi:ss'),to_date ('#dateformat(pulldate, "yyyy/mm/dd")# #timeformat(pulldate, "HH:mm:ss")#', 'yyyy/mm/dd hh24:mi:ss'),'#form.shorttitle#', '#form.longtitle#','#form.byline#','#form.bylinetitle#', '#form.dateline#', #session.userid#,<cfif #application.newsimage# is 2>'#form.image_link#',</cfif>'#form.article_link#',#form.link_override#)
</cfquery>

<cfquery name="getID" datasource="#application.datasource_select#">
SELECT MAX(newsID) as MaxID
FROM CUNVMCS.NEWS
</cfquery>
		</cflock>
		
<cfquery name="updateevents" datasource="#application.datasource_update#">
update     CUNVMCS.news
SET       
DESC_CLOB=<cfqueryparam value="#form.description#" cfsqltype="CF_SQL_CLOB"> where newsid=#getid.maxID#
</cfquery>

<cfquery name="updateevents" datasource="#application.datasource_update#">
update     CUNVMCS.news
SET       
CONTENT_CLOB=<cfqueryparam value="#variables.content1#" cfsqltype="CF_SQL_CLOB">,CONTENT_CLOB2=<cfqueryparam value="#variables.content2#" cfsqltype="CF_SQL_CLOB"> where newsid=#getid.maxID#
</cfquery>

<!--- upload image --->			
		<cfif #application.newsimage# is 1>				
			<cfif form.image is not 'none'>
				<cffile action="RENAME" source="#application.dir#/public/images/#form.image#.jpg" destination="#application.dir#/public/images/#getid.maxID#.jpg">
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
	<cfoutput>
		#getID.recordcount#
	</cfoutput>

	<cflocation url="index.cfm" addtoken="No">	