<cfhttp url="http://www1.luc.edu/umc/newsroom/pagelets/pressroom.shtml" method="GET" resolveurl="yes" throwonerror="yes"></cfhttp>


<cfoutput>
<cfset myfile="#cfhttp.fileContent#">
#myfile#
</cfoutput>