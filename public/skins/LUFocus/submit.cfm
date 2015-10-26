<cfset pagetitle='Submit to LUFocus'>
<cfinclude template="ssi/top.cfm">
<div id="contenttext">
  <h1>Submit an Event or News Item</h1>
 
<p>Please select the appropriate form to submit your <em>LU Focus</em> item. If your submission relates to academics, service opportunities, or general news, please use the first form. All other items related to specific events should be submitted using the second form.</p>

<p>  <cfoutput><ul>
    <li><a href="/newsevents/public/news_submit.cfm?skin=focus&date=#now#">Submit an academic, service, or general news item.</a></li>
    <li><a href="/newsevents/public/calendar_submit.cfm?skin=focus&date=#now#">Submit an event item.</a></li>
  </ul></cfoutput></p>

<p>If you have questions about the submission forms or are uncertain of which form to use, please contact Katie Stasiak at 312.915.7080 or <a href="mailto:kstasia@luc.edu">kstasia@luc.edu</a>. </p>
  

</div>
</div>
<!-- sidebar start -->
<cfinclude template="ssi/sidebar.cfm">
<!-- sidebar end -->
<cfinclude template="ssi/bottom.cfm">
