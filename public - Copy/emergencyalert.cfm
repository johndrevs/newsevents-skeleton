<!--- This pagelet relies upon the University News - Headlines site to have a site id of 41 --->
<cfset siteid=838>


<cfquery datasource="#application.datasource_select#" name="getnewssource">
SELECT site_name,maxrows
FROM CUNVMCS.sites
where siteid=#variables.siteid#
</cfquery>
<cfquery name="getnews" datasource="#application.datasource_select#" maxrows="#getnewssource.maxrows#">
select distinct news.newsid, shorttitle,created,byline,pubdate,pulldate,priority,link_override,article_link,image_link
from CUNVMCS.news, CUNVMCS.news_ref
where	0=0 and news.isactive=1 and news_ref.newsid=news.newsid and news_ref.siteid=(#variables.siteid#) and news_ref.news_ref_level =2 and to_char(pubdate, 'yyyy-mm-dd') <= to_char(SYSDATE, 'yyyy-mm-dd') and to_char(pulldate, 'yyyy-mm-dd') >= to_char(SYSDATE, 'yyyy-mm-dd')	
order by created desc</cfquery>

<!doctype html public "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/DTD/strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="Content-Language" content="en-us">
<meta name="Copyright" content="Copyright (c) Loyola University Chicago">
<meta name="Description" content="Loyola University Chicago-">
<meta name="Template" content="HTML Document">
<meta name="Site" content="">
<meta name="Keywords" content="Loyola University Chicago,">
<title>Loyola University Chicago-</title>
<style type="text/css">body {font-family: verdana,arial,helvetica,clean,sans-serif;
padding: 1.2em 0em;
color: #ffffff;}

#doc2 { margin-left: auto;    margin-right: auto;border: 1px #acacac solid;width:900px;}

a {color: #a30046;}

/*  -----{ header }---------------------------  */

#hd ul {padding: .90em .4em 0 0;
float: right;
height: 1.5em;}

#hd li {list-style: none;
display: inline;}

#hd li a {font-size: 85%;
color: #555f6a;
text-decoration:none;
padding: 0 .7em;
float: left;
text-align: center;
display: block;
width: auto;
border-right: .1em #eaeaea solid;}

#hd li a:hover {color: #a30046;}

#hd li.last a {background-image: none;
border-right: .1em #ffffff solid;}

#hd li a.links:hover {color: #a30046;}




#bd, #interiorcontent {padding: 0em 0em 5.2em 0em;
border: 1px #eaeaea solid;
margin-left: 1em;
margin-right: 1em;
margin-top: 0em;}



#bd h2 {background-color:red;text-align:center}

#bd li{color: #000000;
font-size: 85%;}

#bd dl {padding:.5em;color: #000000;
font-size: 85%;}

#bd dt {font-weight:bold;color: #000000;
font-size: 85%;}

#bd dd {margin-left:15px;color: #000000;
font-size: 85%;}




/*  -----{ footer }---------------------------  */

#ft {width:60em;
clear:both;
margin: 0 auto;
padding: 1em 0 1em 0;
font-size: 80%;
text-align: center;
color: #a30046;}

#ft a {color: #555f6a;
text-decoration:none;}

#ft a:hover {color: #a30046;}

.footerlogo {text-indent/**/: -9999px;
color: #fff;
overflow: visible;
display: block;
height: 185px;
background: #ffffff url("../images/weblogo.gif") no-repeat 50% 35px;}

#hd {height: 154px;
text-align: right;padding-bottom: 1.2em}

#hd h1 {float: left;
width: 300px;
height: 154px;
text-align: left;}

#hd h1 a {color: #fff;
/* rule and filter below for for IE5 */
text-indent/**/: -9999px;
overflow: hidden;
display:block;
width: 300px;
height: 160px;
background: url("http://www.luc.edu/supports/images/luc_stacked_promise_smaller.gif") no-repeat 35px 50px;}

#content_text p {width:50em;}
#directorylist dl{width:auto; margin-left:.05em;margin-right:.50em;}

#ft h2 a{font-weight:bold;color:#555f6a;padding:.5em;margin-bottom: 2em;display:inline;}

  
</style>
</head>

<body>
<!-- Decision to be full screen or not  -->
	<div id="doc2" class="yui-t7">
		<div id="hd">
			<h1><a href="/index.shtml">Loyola University Chicago</a></h1>
		</div>
		<div id="bd">	
		<h2>Emergency Alert</h2>
		<cfif getnews.recordcount gt 0>
<cfoutput query="getnews">

<cfquery name="getnews2" datasource="#application.datasource_select#">
SELECT 
  NEWS.DESC_CLOB
 FROM 
  CUNVMCS.NEWS
WHERE NEWS.NEWSID=#getnews.newsid#
</cfquery>

<cfif currentrow is 1>				
	<cfif isDefined("getnews.newsid") and  fileexists('#application.dir#/public/images/#getnews.newsid#.jpg')><img src="/newsevents/public/images/#getnews.newsid#.jpg" alt="#shorttitle#" class="copyimage_l" /><cfelseif  getnews.image_link neq ''><img src="#getnews.image_link#" alt="#getnews.shorttitle#" border="0" align="left"></cfif>
			<dl>
				<dt>#dateformat(created, "mm-dd-yyyy")# #timeformat(created, "hh:mm")#<br><cfif link_override EQ 1><a href="#article_link#"><cfelse><a href="news_release.cfm?newsID=#newsid#&siteid=0"></cfif>#shorttitle#-</a></dt>
				<dd>#replace(getnews2.DESC_CLOB, "*",chr(34), "ALL")# <p><strong><cfif link_override EQ 1><a href="#article_link#"><cfelse><a href="news_release.cfm?newsID=#newsid#&siteid=0"></cfif>
More...</a></strong></p></dd>
			</dl>
			

					<ul class="headlines">
						
<cfelseif currentrow neq 4>
	<li><cfif link_override EQ 1><a href="#article_link#"><cfelse><a href="news_release.cfm?newsID=#newsid#&siteid=0"></cfif>#shorttitle#</a></li>

</cfif>
</cfoutput>
</ul>

<cfelse>
<ul>
	<li>This page is reserved for use in emergency situations. In the event of an emergency, this page would be redirected to from the university home page.</li>
</ul>
</cfif>
		</div>
		<div id="ft">	<!-- Include footer if exists or use generic -->
					
							
			<br/>LOYOLA UNIVERSITY CHICAGO &middot; 6525 N. Sheridan Rd., Chicago, IL 60626 &middot; 773-274-3000
			<br/><a href="mailto:webmaster@luc.edu">webmaster@luc.edu</a> &middot;  <a href="info/copyright_disclaimer_2007.shtml">&copy; Copyright & Disclaimer 2007</a>
					
				
			<!-- Inclusion of Shield and promise on all pages except index.shtml -->
		</div>
	</div>
</body>

</html>
