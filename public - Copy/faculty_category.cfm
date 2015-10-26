<cfif parameterexists(form.criteria)>
<cfset url.criteria=ucase(form.criteria)>
<cfelse>
</cfif>
<cfquery name="getcategory" datasource="#application.datasource_select#">
SELECT CATEGORIES.category_id,CATEGORIES.category_name,CATEGORIES.sub
FROM CUNVMCS.CATEGORIES
where ACTIVE=1  <cfif parameterexists(url.firstchar)> AND UPPER(category_name) LIKE '#url.firstchar#%'</cfif>
<cfif parameterexists(form.criteria)> AND (UPPER(category_name) LIKE '%#url.criteria#%')</cfif>
<cfif parameterexists(form.criteria) EQ 0 AND parameterexists(url.firstchar) EQ 0> and sub=0</cfif>
order by category_name 
</cfquery>


<cfinclude template="/newsevents/public/ssi/header_061813.cfm">

<article class="content wide">

<h2>Experts Directory Listed by Category</h2>
				<cfinclude template="ssi/experts_menu.cfm">

<p><CFLOOP INDEX="alpha"FROM ="65" TO="90">
   <CFOUTPUT>
<A HREF="faculty_category.cfm?firstchar=#chr(alpha)#">#chr(alpha)#</A> |
  </CFOUTPUT>
</CFLOOP></p>

<p><form action="faculty_category.cfm" method="post"><input type="text" name="criteria"> <input type="submit" value="search" class="button" /></form>&nbsp; <a href="faculty_category.cfm"> View All</a></p>

<p>Please choose a category from the list below.</p>

 <ul>
	<cfoutput query="getcategory">
	
		<li><cfif getcategory.sub EQ 0><a href="faculty_category.cfm?category_id=#category_id#<cfif parameterexists(url.firstchar)>&firstchar=#url.firstchar#</cfif>&sub=#sub#"><cfelse><a href="faculty_list.cfm?category_id=#category_id#"></cfif>#category_name#</a></li>
	<cfif parameterexists(url.category_id) and category_id EQ #url.category_id#>
	<cfquery name="getsubcategory" datasource="#application.datasource_select#">
SELECT CATEGORIES.category_id,CATEGORIES.category_name, CATEGORIES_REF_ID
		FROM CUNVMCS.CATEGORIES, CUNVMCS.CATEGORIES_REF
		WHERE CATEGORIES.SUB=1 AND CATEGORIES.ACTIVE=1 AND CATEGORIES_REF.CATEGORY_ID=#getcategory.category_id# AND CATEGORIES_REF.SUBCATEGORY_ID=CATEGORIES.CATEGORY_ID AND CATEGORIES_REF.ACTIVE=1
order by category_name
</cfquery>	
	<ul>
	<cfloop query="getsubcategory"><li><a href="faculty_list.cfm?category_id=#category_id#">#category_name#</a></li></cfloop><!--- <cfif parameterexists(url.firstchar)>&firstchar=#url.firstchar#</cfif> --->
	</ul>
	
<cfquery datasource="#application.datasource_update#" name="insertpost">
					INSERT INTO CUNVMCS.CATEGORY_LOG(CATEGORY_LOG_ID, CATEGORY_ID, DATETIME)
					VALUES(#timeformat(now(),"sshhmm")##RandRange(10000, 100000)#,#url.category_id# , SYSDATE)
				</cfquery>		
	</cfif>
	</cfoutput>
</div>
</div>
</div>
<cfinclude template="/newsevents/public/ssi/footer_061813.cfm">
