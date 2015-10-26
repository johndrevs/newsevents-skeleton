<cfhttp url="http://www.luc.edu/supports/ssi/header.html" method="GET" resolveurl="yes" throwonerror="yes"></cfhttp>
<cfset myfile="#cfhttp.fileContent#">	

<cfset myfile = removechars(myfile,1,2902)>

<cfset myfile = removechars(myfile,1240,100000)>
<cfoutput>#myfile#</cfoutput>