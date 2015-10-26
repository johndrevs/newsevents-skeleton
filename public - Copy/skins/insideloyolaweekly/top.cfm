		
	<cfif parameterexists(url.date)>	
	<cfset now=createodbcdate(url.date)>
	<cfelse>
		<cfset now=createodbcdate(now())>
	</cfif>
<cfinclude template="siteids.cfm">
<!doctype html public "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
	<cfoutput>
<title>Inside Loyola Weekly: #dateformat(now,"mmm. d, yyyy")#</title>
	</cfoutput>
	
	
</head>
<body style="padding-top:15px;font:13px arial,helvetica,clean,sans-serif;text-align: center;">
	<div align="center"><cfif HTTP_REFERER contains 'generate'>
					<span id="difficulty"><a href="http://www.luc.edu/ilweekly">If you are having trouble viewing this email, please got to htto://www.luc.edu/ilweekly</a></span>
				</cfif>
		<table width="770" border="0" cellspacing="0" cellpadding="0" align="center" style="font-size:13px;border: 1px #cacaca solid; margin:0;">
		<tr>
			<td colspan="3">
			<cfoutput><div id="hd" style="height: 75px;background-image: url(http://#cgi.server_name#/newsevents/public/skins/insideloyolaweekly/ilw_hdr.gif);background-repeat: no-repeat;">				
				
					<span class="date" style="float: right;position: relative;top: 58px;color: ##a30046;font-weight: bold;margin-right:10px">#dateformat(now, "mm/dd/yyyy")#</span>
				
				
			</div></cfoutput></td>
		</tr>
		<tr>
			<td width="530" colspan="2" align="left" valign="top">					
					<cfif CF_TEMPLATE_PATH contains 'news_submit'>
					<div class="yui-g" id="leads" style="font-size: 13px; padding:5px 15px; font-family:Georgia, Times, serif;">		<h3>Submit an <em>Inside Loyola Weekly</em> News Item</h3>
						<div id="content_text">
							
				
<p>Please use the form below to submit a news item to <em>Inside Loyola Weekly</em>. If the news item meets the basic guidelines, it will be added to an upcoming publication. Use of this form will allow other University departments to view/post your item on their respective sites as well. Please fill in ALL fields to ensure accuracy and proper distribution.</p>

<p>For questions or comments, please contact Steve Christensen, University Marketing and Communications, at <a href="mailto:schris6@luc.edu">schris6@luc.edu</a> or 312-915-6164.</p>
					</cfif></div>
