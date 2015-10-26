<cfquery name="getnews" datasource="#application.datasource_select#">
select distinct news.newsid, shorttitle,created,byline,pubdate,pulldate,priority,link_override,article_link,image_link,link_override,article_link
from CUNVMCS.news, CUNVMCS.news_ref
where	0=0 and news.isactive=1 and news_ref.newsid=news.newsid and news_ref.siteid=(#variables.site_id#) and news_ref.news_ref_level =2 and to_char(pubdate, 'yyyy-mm-dd') <= to_char(#variables.now#, 'yyyy-mm-dd') and to_char(pulldate, 'yyyy-mm-dd') >= to_char(#variables.now#, 'yyyy-mm-dd')	
order by priority
</cfquery>
	<cfif getnews.recordcount gt 0>
		<cfoutput>
			<h3 style="font-size: .82em;font-weight: bold;margin-bottom:1em;text-transform: none;">#title#</h3>
		</cfoutput>
		<ul>
			<cfoutput query="getnews">
				<li style="font-size: .8em;line-height: 1.5em;list-style-type: disc;margin-left: -1.5em;"><a href="###newsid#" style="color: ##a30046;">#shorttitle#</a></li>
			</cfoutput>
		</ul>
	</cfif>
