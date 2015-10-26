<cfhttp url="http://www.luc.edu/supports/ssi/footer.html" method="GET" resolveurl="yes" throwonerror="yes"></cfhttp>


<cfoutput>
<cfset myfile="#cfhttp.fileContent#">
#myfile#
</cfoutput>