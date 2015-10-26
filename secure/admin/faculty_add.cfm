<cfset page='admin'>
<cfset sort='no'>
<cfinclude template="/newsevents/secure/templates/top.cfm">
<h2>Add a Faculty Expert</h2>
<p>Please enter the last name of the person who you would like to add:

<form action="faculty_add_search.cfm" method="post">
<input type="text" name="criteria"><br/>
Search: Faculty <input type="radio" name="filter" value="1" checked> All <input type="radio" name="filter" value="0"><br/><input type="submit" value="search"></form></p>
<cfinclude template="/newsevents/secure/templates/footer.cfm">
