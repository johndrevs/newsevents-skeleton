<cfhttp url="http://www.luc.edu/umc/newsroom/pagelets/policies_guidelines.shtml" method="GET" resolveurl="yes" throwonerror="yes"></cfhttp>


<cfoutput>
<cfset myfile="#cfhttp.fileContent#">
#myfile#
</cfoutput>