
<html lang="en">
<head>
<title>Loyola FOCUS
	<cfoutput>
		<cfif parameterexists(now)>
		#dateformat(now,"mmm. d, yyyy")#
		<cfelse>
		#dateformat(now(),"mmm. d, yyyy")#
		</cfif>
	</cfoutput>
</title>
<style type="text/css" media="screen">


td, p {margin:1em 0;font-size: .82em;}

a {color: #a30046;
text-decoration:none}


a:hover {text-decoration: underline}

</style>
</head>
<body>
	<table cellspacing="0" cellpadding="5" width="670" align="center" border="0" style="padding: .75em;border: .05em #cacaca solid;">
		<tbody>
			<tr bgcolor="#a30046" width="100%" colspan="2">
				<td width="100%" bgcolor="#a30046" colspan="2"><a href="http://www.luc.edu/focus/"><img alt="" src="http://www.luc.edu/focus/images/masthead.jpg" border="0"></a></td>
			</tr>
			<tr>
				<td width="100%" style="padding:1em"><font face="verdana, tahoma, arial, helvetica, sans-serif">					
				<cfif CF_TEMPLATE_PATH contains 'news_submit'>
				
				<h3>Submit a <em>Loyola Focus</em> News Item</h3>
				
<p>Please use the form below to submit a news item to <em>Loyola Focus</em>. If the news item meets the basic guidelines, it will be added to an upcoming publication. Use of this form will allow other University departments to view/post your item on their respective sites as well. Please fill in ALL fields to ensure accuracy and proper distribution.</p>

<p>If you have questions or comments about Loyola Focus, please contact Melissa Niksic at <a href="mailto:mniksic@luc.edu">mniksic@luc.edu</a>, or call 773.508.7308.</p>

				
				</cfif>
