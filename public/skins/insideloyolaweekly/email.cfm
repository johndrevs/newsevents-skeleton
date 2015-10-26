<cfif isdefined("url.aud")>
  <cfset aud=url.aud>
  <cfelse>
  <cfset aud=0>
</cfif>
<cfif parameterexists(url.date)>
  <cfset now=createodbcdate(url.date)>
  <cfelse>
  <cfset now=createodbcdate(now())>
</cfif>
<cfinclude template="siteids.cfm"><!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Inside Loyola Weekly</title>
</head>
<body>
<div style="padding-top:15px;font:13px arial,helvetica,clean,sans-serif;text-align: center;">
  <cfif HTTP_REFERER contains 'generate'>
    <span id="difficulty"><a href="http://www.luc.edu/ilweekly">If you are having trouble viewing this email, please got to http://www.luc.edu/ilweekly</a></span>
  </cfif>
  <table width="770" border="0" cellspacing="0" cellpadding="0" align="center" style="font-size:13px;border: 1px #cacaca solid; margin:0;">
    <tr>
      <td colspan="3"><cfoutput>
          <div id="hd" style="height: 75px;background-image: url(http://#cgi.server_name#/newsevents/public/skins/insideloyolaweekly/ilw_hdr.gif);background-repeat: no-repeat;"> <span class="date" style="float: right;position: relative;top: 58px;color: ##a30046;font-weight: bold;margin-right:10px">#dateformat(now, "mm/dd/yyyy")#</span> </div>
        </cfoutput></td>
    </tr>
    <tr>
      <td width="530" colspan="2" align="left" valign="top"><cfif CF_TEMPLATE_PATH contains 'news_submit'>
          <div class="yui-g" id="leads" style="font-size: 13px; padding:5px 15px; font-family:Georgia, Times, serif;">
          <h3>Submit an <em>Inside Loyola Weekly</em> News Item</h3>
          <div id="content_text">
            <p>Please use the form below to submit a news item to <em>Inside Loyola Weekly</em>. If the news item meets the basic guidelines, it will be added to an upcoming publication. Use of this form will allow other University departments to view/post your item on their respective sites as well. Please fill in ALL fields to ensure accuracy and proper distribution.</p>
            <p>For questions or comments, please contact Steve Christensen, University Marketing and Communications, at <a href="mailto:schris6@luc.edu">schris6@luc.edu</a> or 312-915-6164.</p>
          </div>
        </cfif>
        <div class="yui-g" id="leads" style="font-size: 13px; padding:15px 25px 15px 15px; font-family:Georgia, Times, serif;">
          <cfset site_id=#importantinfo_id#>
          <cfinclude template="ssi/importantinformation.cfm">
          <cfset site_id=#leadsubs_id#>
          <cfinclude template="ssi/ul.cfm">
        </div></td>
      <td width="240" rowspan="5" valign="top" bgcolor="#E8E8E8" style="font-size: 10px"><cfif variables.image_link neq ''>
          <cfoutput><img src="#image_link#" alt="#image_alt#" width="240" height="228" border="0"></cfoutput>
        </cfif>
        <div id="links" style="margin-top:15px;padding:0 13px;text-align:left;">
          <h3 style="color: #686868;font-size: 13px;">FEATURED EVENTS</h3>
          <cfset site_id=#upcomingevents_id#>
          <cfinclude template="ssi/upcomingevents.cfm">
          <cfinclude template="ssi/ul.cfm">
          <cfoutput><img src="#application.url#/public/skins/insideloyolaweekly/calendar.gif" alt="" width="18" height="14" border="0" style="padding-left:10px;padding-right:15px;margin:15px 0 -5px 0;"><a href="http://www.luc.edu/calendar" style="color: ##a30046;text-decoration:none;font-size: 12.5px;">Complete Events Calendar</a>
            <hr style="margin:15px 0">
            <a href="http://#cgi.server_name#/newsevents/public/news_submit.cfm?skin=il" style="color: ##a30046;text-decoration:none;font-size: 12.5px;">To suggest a news item or event for <em>Inside Loyola Weekly</em>, please click here.</a> </cfoutput> </div>
        <br></td>
    </tr>
    <tr>
      <td valign="top" align="left" width="260" style="padding-right:15px;padding-left:15px;"><div style="border-right: 1px #a5a5a5 solid;">
          <h3 style="text-transform: uppercase;color: #686868;font-size: 12px;font-weight: bold;margin-bottom:5px;">Media Spotlight</h3>
          <cfset site_id=#lim_id#>
          <cfinclude template="ssi/dl.cfm">
        </div></td>
      <td valign="top" align="left" width="260" style="padding-right:5px;padding-left:0px;"><h3 style="text-transform: uppercase;color: #686868;font-size: 12px;font-weight: bold;margin-bottom:5px;">Kudos</h3>
        <cfset site_id=#kudos_id#>
        <cfinclude template="ssi/dl.cfm"></td>
    </tr>
  </table>
  <table width="770" border="0" cellspacing="0" cellpadding="0" align="center" style="font-size:13px; margin:0;">
    <tr>
      <td colspan="3" valign="top" align="center"><cfoutput>
          <div id="ft" style="width:770px;margin:10px auto 0 auto;background-image: url(http://www.luc.edu/supports/images/weblogo.gif);background-repeat: no-repeat;height:180px;background-position: bottom center">
            <ul style="margin:0 auto">
              <li style="color: ##a30046;display: inline;font-family:Georgia, Times, 'Times New Roman', serif;"><a href="http://www.luc.edu/ilweekly/about.shtml" style="color: ##a30046;padding-right:30px;background-image: url(http://#cgi.server_name#/newsevents/public/skins/insideloyolaweekly/star.gif);background-repeat: no-repeat;background-position: right;">About IL Weekly</a></li>
              <li style="display: inline;font-family:Georgia, Times, serif;"><a href="http://www.luc.edu/ilweekly/contactus.shtml" style="color: ##a30046;padding:30px;padding-left:15px;background-image: url(http://#cgi.server_name#/newsevents/public/skins/insideloyolaweekly/star.gif);background-repeat: no-repeat;background-position: right;">Contact Us</a></li>
              <li style="display: inline;font-family:Georgia, Times, 'Times New Roman', serif;"><a href="http://www.luc.edu/ilweekly/feedback.shtml" style="color: ##a30046;padding-left:15px;">Tell Us What You Think</a></li>
            </ul>
          </div>
        </cfoutput></td>
    </tr>
  </table>
</div>
</body>
</html>