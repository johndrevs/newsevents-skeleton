


	<cfset temp = "<p>This is the Content Field. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur aliquam arcu in quam. Pellentesque wisi arcu, iaculis in, dapibus quis, gravida quis, mauris. Aliquam pharetra arcu a lectus. Vivamus sodales purus aliquam eros. Pellentesque odio est, tincidunt at, adipiscing sed, congue tristique, magna. Nam imperdiet massa. Curabitur non nisl. Etiam eleifend. Etiam ligula lacus, laoreet tincidunt, vehicula pellentesque, iaculis sed, ligula. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nunc lobortis risus in wisi.</p> 

<p>Vestibulum molestie rhoncus massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Integer sit amet wisi. Donec dui nulla, vulputate eu, suscipit sed, facilisis sit amet, odio. In accumsan sodales arcu. Vestibulum vel elit vel dolor porta volutpat. Sed sollicitudin, ante sed cursus feugiat, metus metus fringilla nulla, ut molestie lorem augue vitae arcu. Nunc tempus ante pellentesque mauris. Aliquam bibendum. Sed elementum, turpis ac rutrum aliquet, odio ligula dapibus lectus, ut viverra velit quam eget massa. </p>

<p>In sit amet libero. Aenean pulvinar elit in risus. Vivamus mollis. Nullam sodales consectetuer est. Fusce laoreet, dui eu placerat semper, odio neque scelerisque risus, at tempor elit dui et libero. Curabitur sit amet dui. Fusce ipsum. Duis elementum. Donec in dolor. Nunc ullamcorper dictum ante. Donec vestibulum, lacus sed porttitor iaculis, diam lacus auctor dolor, vel porttitor erat odio ac augue. Duis ornare rutrum turpis. Ut viverra.</p> 

<p>Nunc auctor tortor eget elit scelerisque tempus. Fusce rutrum sodales purus. Nunc at felis. Ut volutpat mauris id nisl. Cras fringilla libero sed velit. Nulla pellentesque, ante ut pretium aliquet, metus lacus mattis lorem, tristique cursus massa nibh non magna. Duis a lorem fringilla quam eleifend pellentesque. Proin sem. Proin sodales. Morbi consectetuer, mauris ac facilisis pretium, erat tellus tincidunt arcu, vitae interdum lorem lacus cursus nulla. Fusce ut lacus. Ut lobortis. Suspendisse sed arcu. Aenean eu diam. Ut tempus ornare sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aliquam eleifend, tellus ac consequat consequat, nibh risus facilisis purus, non lobortis erat lacus a justo. Donec urna odio, mattis vitae, varius nec, mollis a, est. Phasellus ornare tincidunt mi. </p>

<p>Nullam mi quam, vehicula condimentum, porta sed, convallis a, augue. Phasellus dolor dolor, posuere a, pellentesque in, ultrices nec, ligula. Suspendisse potenti. Proin pellentesque. Pellentesque nunc turpis, aliquam vitae, imperdiet a, porttitor sit amet, dolor. In non nibh. Fusce metus ante, sollicitudin bibendum, viverra eu, vestibulum eget, libero. Curabitur ipsum enim, sollicitudin et, lobortis sit amet, mattis et, est. Pellentesque condimentum diam et orci. Vivamus dignissim mattis nunc. Aliquam pede lacus, facilisis in, sollicitudin non, tincidunt id, lacus. Maecenas commodo ultrices nunc.</p>">	
	<cfset temp2 = replace(temp,chr(13)&chr(10)&chr(13)&chr(10),"<p>","all")>	
	<cfset temp3 = replace(temp2,chr(13)&chr(10),"<br/>","all")>	
	<cfset temp4 = replace(temp3,chr(32)&chr(32)&chr(32),"&nbsp;&nbsp;&nbsp;","all")>	
	<cfset FormatBody= replace(temp4,chr(9),"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;","all")>	
	<cfset description="This is the Description Field. It will be displayed as a leader into the article when a listing of articles is displayed.">	
	<cfset created="1/1/00">	
	<cfset pubdate="1/1/00">	
	<cfset pulldate="1/1/00">	
	<cfset lastmod="1/1/00">	
	<cfset longtitle="This is the Long Title field. It will be the main title of the article.">	
	<cfset shorttitle="This is the Short Title field. It will be a compact version of the title when the long title is too long.">	
	<cfset byline="This is the Byline Field">	
	<cfset bylinetitle="This is the Byline Title Field">	
	<cfset dateline="This is the Date Line Field">	
	<cfset content="This is the Byline Field">	
	<cfset firstname="N/A">	
	<cfset lastname="N/A">	
	<cfset userid="0">	
	<cfset user_admin="Administrator">
	
<cfinclude template="/newsevents/secure/templates/top_small.cfm">
	<cfinclude template="/newsevents/secure/templates/news_layout.cfm">
	
<cfinclude template="/newsevents/secure/templates/footer.cfm">


