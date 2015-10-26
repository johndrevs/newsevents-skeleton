	<cfhttp url="http://orpheus.it.luc.edu/gpem/styles/header.html" method="GET" resolveurl="yes" throwonerror="yes"></cfhttp>

	<cfoutput>
		<cfset myfile="#cfhttp.fileContent#">			
		<cfif isdefined("template") eq 0>
		<cfelse>
				<cfset myfile = replace(myfile,"doc2","doc3","all")>
		</cfif>
		<cfif CF_TEMPLATE_PATH contains 'calendar'>

			<cfset myfile = replace(myfile,'href="http://www.luc.edu/"','href="http://www.luc.edu/calendar"','all')>
			 <cfset myfile = replace(myfile,'(c) Loyola University Chicago">','(c) Loyola University Chicago"><META name="ROBOTS" content="NOINDEX, NOFOLLOW">','all')>
			<cfelseif isdefined("url.headerloc")>
			<cfset myfile = replace(myfile,'url("images/header.gif")','url("#url.headerloc#")','all')>
            <cfelse>
			<cfset myfile = replace(myfile,"header.gif","header_news.gif","all")>
			<cfset myfile = replace(myfile,'href="http://www.luc.edu/"','href="http://www.luc.edu/news"','all')>
           
			</cfif>
		#myfile#
	</cfoutput>
    
<script type="text/javascript" src="ssi/drop.js"></script>
<link href="styles/newsevents.css" rel="stylesheet" type="text/css">
	<div class="yui-g" id="mainnav">
		
		<ul>
			<cfif CF_TEMPLATE_PATH contains 'calendar'>

			
			<li><a href="http://www.luc.edu/academics/schedules/index.shtml">Official Academic Calendar</a></li>
			<li><a href="news.cfm">University Newsroom</a></li>
			<cfelse>
			
			<li><a href="http://www.luc.edu/academics/schedules/index.shtml">Official Academic Calendar</a></li>
			<li><a href="calendar.cfm">University Calendar</a></li>
			</cfif>
		</ul>
	</div>
	<div class="yui-g" id="railroad">
	</div>
	<div id="main">
		<div class="yui-g" id="content">
