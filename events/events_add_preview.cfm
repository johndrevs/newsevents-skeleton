
<cfinclude template="/newsevents/templates/securityheader.cfm">

<cfinclude template="/newsevents/templates_new/events_add_set.cfm">
<cfset page='events'>
<cfset sort='no'>
<cfinclude template="/newsevents/templates_new/top.cfm">


<h2>Preview Event</h2>
<p>The events that you entered will be displayed as follows. If you have any changes, please  click on the 'back' button at the bottom of the screen. If everything is correct, please continue by clicking on the 'upload to site' button.</p>


<cfinclude template="/newsevents/templates/events_layout.cfm">

<cfinclude template="/newsevents/templates_new/events_add_form.cfm">
	
<cfinclude template="/newsevents/templates_new/footer.cfm">
