<cfhttp url="http://www.luc.edu/umc/newsroom/ssi/news_footer.shtml" method="GET" resolveurl="yes" throwonerror="yes"></cfhttp>


<cfoutput>
<cfset myfile="#cfhttp.fileContent#">
#myfile#
</cfoutput>