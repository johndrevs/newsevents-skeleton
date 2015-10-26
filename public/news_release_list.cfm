<!--- This pagelet relies upon the University News - Headlines site to have a site id of 41 --->
<cfif isdefined("url.siteid")>
  <cfset url.siteid=url.siteid>
  <cfelse>
  <cfset url.siteid=558>
</cfif>
<cfif isdefined("url.headerloc")>
  <cfset url.headerloc=url.headerloc>
  <cfelse>
  <cfset url.headerloc='http://eros.is-svr.luc.edu/newsevents/public/images/header_news.gif'>
</cfif>
<cfif parameterexists(url.month)>
  <cfset displaymonth=url.month>
  <cfelseif parameterexists(display) and url.display NEQ 'search'>
  <cfset displaymonth=#dateformat(now(),"m")#-1>
  <cfelse>
  <cfset displaymonth=#dateformat(now(),"m")#>
</cfif>
<cfif parameterexists(url.year)>
  <cfset displayyear=url.year>
  <cfelse>
  <cfset displayyear=#dateformat(now(),"yyyy")#>
</cfif>
<cfquery datasource="#application.datasource_select#" name="getnewssource">
SELECT site_name,maxrows
FROM CUNVMCS.sites
where siteid=#url.siteid#
</cfquery>
<cfquery name="getnews" datasource="#application.datasource_select#">
select distinct news.newsid, longtitle,shorttitle,created,byline,pubdate,pulldate,priority,link_override,article_link,image_link,dateline, to_char(pubdate,'MM') as pubmonth
from CUNVMCS.news, CUNVMCS.news_ref
where	0=0 and news.isactive=1 and news_ref.newsid=news.newsid  and news_ref.news_ref_level =2 <cfif parameterexists(url.display) and url.display EQ 'search'>and news.desc_clob like '%#form.q#%'<cfelse>and news_ref.siteid=(#url.siteid#) and to_char(pubdate, 'mm') = #variables.displaymonth# and to_char(pubdate, 'yyyy') = #variables.displayyear#</cfif>
group by pubdate, news.newsid, longtitle,shorttitle,created,byline,pulldate,priority,link_override,article_link,image_link,dateline
order by pubdate desc <!--- <cfabort> --->
</cfquery>
<cfinclude template="/newsevents/public/ssi/header_61807.cfm">
<cfset pubdate="#getnews.pubdate#">
<cfset pulldate="#getnews.pulldate#">
<cfset longtitle="#getnews.longtitle#">
<cfset shorttitle="#getnews.shorttitle#">
<cfset dateline="#getnews.dateline#">
<cfset image_link="#getnews.image_link#">
<cfset article_link="#getnews.article_link#">
<cfset link_override="#getnews.link_override#">

<cfquery datasource="#application.datasource_select#" name="getpublication">
SELECT site_name
FROM CUNVMCS.sites
where siteid=#url.siteid#
</cfquery>

<a name="top"></a>
<h3>News
  <cfif displaymonth NEQ dateformat(now(),"m")>
    Archive
  </cfif>
</h3>
<ul>
  <cfif (displaymonth EQ #dateformat(now(),"m")#) AND (displayyear EQ dateformat(now(),"yyyy"))>
    <cfoutput>
      <p><a href="news_release_list.cfm?display=archive&siteid=#url.siteid#&headerloc=#url.headerloc#">View News Archive</a></p>
    </cfoutput>
	<cfelse><br>
    <CFLOOP INDEX="year" 
    FROM="#dateformat(now(),"yyyy")#" 
    TO="2004" 
    STEP="-1">
      <p>
      <strong><CFOUTPUT>#year#</CFOUTPUT>:</strong>
      <cfloop index="x" from="1" to="12">
        <Cfoutput>
          <cfif x lte dateformat(now(),"m") or year lt dateformat(now(),"yyyy")>
            <a href="news_release_list.cfm?month=#x#&year=#year#&siteid=#url.siteid#&headerloc=#url.headerloc#">#left(ucase(MonthAsString(x)),3)#</a> |
            <cfelse>
          </cfif>
        </CFOUTPUT>
      </cfloop>
    </CFLOOP>

  </cfif> 
  
  
  <cfoutput><p><h2 class="headerText">#dateformat(pubdate,"mmmm yyyy")#</h2></p></cfoutput>
  <cfif getnews.recordcount lt 1>
    <p>There are no releases for this month.</p>
    <cfelse>
    <cfoutput query="getnews" group="pubmonth">
      <A NAME="december2005"></a>
       
      
      <cfoutput>
        <cfquery name="getnews2" datasource="#application.datasource_select#">
SELECT 
  NEWS.DESC_CLOB
 FROM 
  CUNVMCS.NEWS
WHERE NEWS.NEWSID=#getnews.newsid#
</cfquery>
        <li>
          <cfif link_override EQ 1>
            <a href="#article_link#">
            <cfelse>
            <a href="news_release.cfm?newsID=#newsid#&siteid=#url.siteid#&headerloc=#url.headerloc#">
          </cfif>
          <cfif shorttitle eq longtitle or shorttitle is ''>
            #longtitle#
            <cfelseif longtitle is ''>
            #shorttitle#
            <cfelse>
            #longtitle#
          </cfif>
          </a> <br>
          <br>
          <strong>#dateline#</strong> #replace(getnews2.DESC_CLOB, "*",chr(34), "ALL")#</li>
        <br>
        <br>
      </cfoutput></cfoutput>
  </cfif>
  </p>
</ul>
</div>
</div>
<!-- end pagelet content -->
<!-- custom footer -->
<cfinclude template="/newsevents/public/ssi/footer_61807.cfm">
</body></html>