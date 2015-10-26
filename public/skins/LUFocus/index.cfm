
<cfset pagetitle='Home Page'>
<cfinclude template="ssi/top.cfm">


 <cfoutput query="getnews" maxrows="3" startrow="2">
    <cfquery name="getnews2" datasource="#application.datasource_select#">
    select desc_clob
    from CUNVMCS.news
    where newsID=#getnews.newsid#
    </cfquery>
    <cfset headernumber=(currentrow-1)>
    <h#headernumber#><a href="internal.cfm?newsid=#newsid#&date=#now#">#getnews.shorttitle#</a></h#headernumber#>
    <p class="general">#replace(getnews2.desc_clob, "*", "&quot;", "all")# <a href="internal.cfm?newsid=#newsid#&date=#now#" class="more">More...</a></p>
  </cfoutput>
  <ul class="bullets-list">
    <cfloop query="getnews" startrow="5">
      <cfoutput>
        <li><a href="internal.cfm?newsid=#newsid#&date=#now#">#shorttitle#</a></li>
      </cfoutput>
    </cfloop>
  </ul>
  <div class="colums">
    <div>
      
      <cfset title='Academics'>
      <cfset site_id=#ac_id#>
      <cfinclude template="ssi/ul_focus.cfm">
    </div>
    <div>
     
      <cfset site_id=#etc_id#>
      <cfset title='FYI'>
      <cfinclude template="ssi/ul_focus.cfm">
      <cfset title='Free Stuff '&#chr(60)#&'span'&#chr(62)#&'(who doesn'&#chr(39)#&'t like free stuff?)'&#chr(60)#&#chr(47)#&'span'&#chr(62)#>
     <cfoutput> <cfset title='#title#'></cfoutput>
      
      <cfset site_id=#fs_id#>
      <cfinclude template="ssi/ul_focus.cfm">
      <cfset title='Service opportunities'>
      <cfset site_id=#so_id#>
      <cfinclude template="ssi/ul_focus.cfm">
    </div>
  </div>
</div>
<!-- main content end -->
<!-- sidebar start -->
<cfinclude template="ssi/sidebar.cfm">
<!-- sidebar end -->
</div>
<cfinclude template="ssi/bottom.cfm">
