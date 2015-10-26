<cfif parameterexists(url.date)>
  <cfset now=createodbcdate(url.date)>
  <cfelse>
  <cfset now=createodbcdate(now())>
</cfif>
<cfinclude template="../siteids.cfm">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>LU Focus<cfif isdefined("pagetitle")><cfoutput>- #variables.pagetitle#</cfoutput></cfif></title>
		<link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/2.3.0/build/menu/assets/menu.css"><cfoutput><link rel="stylesheet" type="text/css" href="http://#cgi.server_name#/newsevents/public/skins/LUFocus/css/all.css" /><cfif cgi.PATH_TRANSLATED contains 'public\calendar.cfm'><link rel="stylesheet" type="text/css" href="http://#cgi.server_name#/newsevents/public/skins/LUFocus/css/calendar.css" /><cfelse></cfif><link href="http://#cgi.server_name#/newsevents/public/styles/newsevents.css" rel="stylesheet" type="text/css">
</cfoutput>
        
		<script type="text/javascript" src="/newsevents/public/skins/LUFocus/js/main.js"></script>
<script type="text/javascript" src="http://yui.yahooapis.com/2.3.0/build/yahoo-dom-event/yahoo-dom-event.js"></script>
<script type="text/javascript" src="http://yui.yahooapis.com/2.3.0/build/dragdrop/dragdrop-min.js"></script>
<script type="text/javascript" src="http://yui.yahooapis.com/2.3.0/build/animation/animation-min.js"></script>
<script type="text/javascript" src="http://yui.yahooapis.com/2.3.0/build/connection/connection-min.js"></script>
<script type="text/javascript" src="http://yui.yahooapis.com/2.3.0/build/container/container-min.js"></script>  
<script type="text/javascript" src="http://yui.yahooapis.com/2.3.0/build/menu/menu-min.js"></script>
<script type="text/javascript" src="http://www.luc.edu/supports/javascripts/audience.js"></script>
<script type="text/javascript" src="http://www.luc.edu/supports/javascripts/slide.js"></script>
<script type="text/javascript" src="http://www.luc.edu/supports/javascripts/flash.js"></script>
<script language="JavaScript" src="http://www.luc.edu/supports/javascripts/faq.js" type="text/javascript"></script> 

<!-- Page-specific script -->

        <script type="text/javascript">

            YAHOO.example.onMenuReady = function() {

                var oMenu = new YAHOO.widget.Menu("menuwithgroups", {iframe:true, zindex:12,  constraintoviewport:false,  context:["menutoggle","tr","br"] });

                oMenu.render();

                oMenu.showEvent.subscribe(function() {

                    this.focus();
                
                }); 
				 YAHOO.util.Event.addListener("menutoggle", "click", oMenu.show, null, oMenu);

            };
            YAHOO.util.Event.onContentReady("menuwithgroups", YAHOO.example.onMenuReady);
            
        </script>
		<!--[if lt IE 7]><link rel="stylesheet" type="text/css" href="css/ie6.css" media="screen"/><![endif]-->
	</head>
	<body>
	<div id="page-box">
		<!-- content start -->
		<div id="content"> 
			<!-- header start -->
			<cfoutput><div id="header">
				<a href="/newsevents/public/skins/LUFocus/index.cfm?date=#dateformat(now,"mm/dd/yyyy")#"><img src="/newsevents/public/skins/LUFocus/images/logo.gif" alt="LU Wolf" /></a>
				<span>#dateformat(now,"mm/dd/yyyy")#</span>
				
				<!-- <cfinclude template="uninav.cfm"> </cfoutput> -->
			</div>
           
			<!-- header end -->
			<!-- container start -->
			<br />

		<div id="container">
			
<script language="javascript">
	if (AC_FL_RunContent == 0) {
		alert("This page requires AC_RunActiveContent.js.");
	} else {
		AC_FL_RunContent(
			'codebase', 'http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0',
			'width', '740',
			'height', '275',
			'src', 'lufocus_loader_bar_right',
			'quality', 'high',
			'pluginspage', 'http://www.macromedia.com/go/getflashplayer',
			'align', 'middle',
			'play', 'true',
			'loop', 'true',
			'scale', 'noscale',
			'wmode', 'transparent',
			'devicefont', 'false',
			'id', 'lufocus_loader_bar_right',
			'bgcolor', '#ffffff',
			'name', 'lufocus_loader_bar_right',
			'menu', 'true',
			'allowFullScreen', 'false',
			'allowScriptAccess','sameDomain',
			'movie', 'lufocus_loader_bar_right',
			'salign', ''
			); //end AC code
	}
</script>

<!-- flash holder start -->


	


<cfif cgi.CF_TEMPLATE_PATH contains "index">
	<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0" width="740" height="275" id="lufocus_loader_bar_right" align="middle">
	<param name="allowScriptAccess" value="sameDomain" />
	<param name="allowFullScreen" value="false" />
	<param name="movie" value="lufocus_loader_bar_right.swf" /><param name="quality" value="high" /><param name="scale" value="noscale" /><param name="wmode" value="transparent" /><param name="bgcolor" value="#ffffff" />	<embed src="lufocus_loader_bar_right.swf" quality="high" scale="noscale" wmode="transparent" bgcolor="#ffffff" width="740" height="275" name="lufocus_loader_bar_right" align="middle" allowScriptAccess="sameDomain" allowFullScreen="false" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />
	</object>
	
	<cfset site_id=#tn_id#>
<cfset title='TOP NEWS'>

<cfquery name="getnews" datasource="#application.datasource_select#">
select distinct news.newsid, shorttitle,created,byline,pubdate,pulldate,priority,link_override,article_link,image_link,link_override,article_link
from CUNVMCS.news, CUNVMCS.news_ref
where	0=0 and news.isactive=1 and news_ref.newsid=news.newsid and news_ref.siteid=(#variables.site_id#) and news_ref.news_ref_level =2 and to_char(pubdate, 'yyyy-mm-dd') <= to_char(#variables.now#, 'yyyy-mm-dd') and to_char(pulldate, 'yyyy-mm-dd') >= to_char(#variables.now#, 'yyyy-mm-dd')	
order by priority
</cfquery>




</cfif>
				

				
<!-- flash holder end -->

				<!-- union box start -->
				<div id="union-box"><!-- main content start -->

<div id="main-content"><cfif CF_TEMPLATE_PATH contains 'news_submit'>
				<div id="contenttext">
				<h3>Submit a <em>LU Focus</em> News Item</h3>
				
<p>Please use the form below to submit a news item to <em>LU Focus</em>. If the news item meets the basic guidelines, it will be added to an upcoming publication. Use of this form will allow other University departments to view/post your item on their respective sites as well. Please fill in ALL fields to ensure accuracy and proper distribution.</p>

<p>If you have questions or comments about <em>LU Focus</em>, please contact Katie Stasiak at <a href="mailto:kstasia@luc.edu">kstasia@luc.edu</a>, or call 312.915.7080.</p>
<cfelseif cgi.PATH_TRANSLATED contains 'public/calendar.cfm'><cfoutput><h3 class="first">Student Calendar</h3><a href="/newsevents/public/skins/LUFocus/submit.cfm?skin=focus&date=#now#"><img src="/newsevents/public/skins/LUFocus/images/submit_buttononly.gif" alt="submit content" id="submitbutton" /></a></cfoutput>
				
				</cfif>