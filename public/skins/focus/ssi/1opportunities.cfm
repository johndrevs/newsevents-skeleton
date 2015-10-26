<cfif parameterexists(url.date)>
<cfset now=createodbcdate(url.date)>
<cfelse>
<cfset now=createodbcdate(now())>
</cfif>
<cfquery name="getnews" datasource="#application.datasource_select#">
select distinct news.newsid, shorttitle,created,byline,pubdate,pulldate,priority,link_override,article_link,image_link,link_override,article_link
from CUNVMCS.news, CUNVMCS.news_ref
where	0=0 and news.isactive=1 and news_ref.newsid=news.newsid and news_ref.siteid=(#variables.opps_id#) and news_ref.news_ref_level =2 and to_char(pubdate, 'yyyy-mm-dd') <= to_char(#variables.now#, 'yyyy-mm-dd') and to_char(pulldate, 'yyyy-mm-dd') >= to_char(#variables.now#, 'yyyy-mm-dd')	
order by priority

</cfquery>

	<cfoutput query="getnews">
<cfquery name="getnews2" datasource="#application.datasource_select#">
SELECT   NEWS.DESC_CLOB
 FROM   CUNVMCS.NEWS
WHERE NEWS.NEWSID=#getnews.newsid#
</cfquery>
<cfset temp = "#getnews2.desc_clob#">
<cfset temp2 = replace(temp,chr(13)&chr(10)&chr(13)&chr(10),"<p>","all")>
<cfset temp3 = replace(temp2,chr(13)&chr(10),"<br/>","all")>
<cfset temp4 = replace(temp3,chr(32)&chr(32)&chr(32),"&nbsp;&nbsp;&nbsp;","all")>
<cfset FormatBody= replace(temp4,chr(9),"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;","all")>
<p><strong><font color="##8E2344">&raquo; <cfif link_override eq 1><a href="#article_link#"></cfif>#getnews.shorttitle#<cfif link_override eq 1></a></cfif></strong></font><br><br>
#replace(variables.formatbody, "*",chr(34), "ALL")#</p>   
</cfoutput>


