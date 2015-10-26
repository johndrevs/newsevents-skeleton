<cfhttp url="http://www.luc.edu/umc/newsroom/pagelets/publications_media.shtml" method="GET" resolveurl="yes" throwonerror="yes"></cfhttp>


<cfoutput>
<cfset myfile="#cfhttp.fileContent#">
#myfile#
</cfoutput>