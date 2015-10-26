<cfquery name="getnews" datasource="#application.datasource_select#">
select distinct news.newsid, shorttitle,created,byline,pubdate,pulldate,priority,link_override,article_link,image_link,link_override,article_link
from CUNVMCS.news, CUNVMCS.news_ref
where	0=0 and news.isactive=1 and news_ref.newsid=news.newsid and news_ref.siteid=(#variables.site_id#) and news_ref.news_ref_level =2 and to_char(pubdate, 'yyyy-mm-dd') <= to_char(#variables.now#, 'yyyy-mm-dd') and to_char(pulldate, 'yyyy-mm-dd') >= to_char(#variables.now#, 'yyyy-mm-dd')	
order by priority
</cfquery>
			<cfif getnews.recordcount gt 0>
		<cfoutput>
			<h4 style="font-size: 1em;font-weight: bold;margin-bottom:.5em;text-transform: none;color: ##a30046;">#title#</h4>
		</cfoutput>
		<cfoutput query="getnews">
<cfquery name="getclob" datasource="#application.datasource_select#" maxrows="1">
SELECT DESC_CLOB,CONTENT_CLOB
FROM   CUNVMCS.news 
WHERE newsid=#newsid#
</cfquery>
			<div id="blurb" style="margin:1em 0;font-size: .82em;"><a class="anchorGlyph" name="#newsid#"></a>					
				<cfif getnews.image_link neq ''><img src="#image_link#" alt="#shorttitle#" border="0" style="border: .05em ##939393 solid;float:right;margin:1em;">
				</cfif>
				<h3 style="font-size: 1em;font-weight: bold;margin-bottom:1em;text-transform: none;">#shorttitle#</h3>					
				<cfif getclob.desc_clob neq ''>
					#getclob.DESC_CLOB#
				<cfelse>
					#getclob.CONTENT_CLOB#
				</cfif>
			</div>
		</cfoutput>
		<hr>
	</cfif>
