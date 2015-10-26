<!doctype html public "-//W3C//DTD HTML 4.01 Transitional//EN"><!-- -->
<html>
<head>
<link rel="stylesheet" href="styles/basic.css" type="text/css">

<link rel="stylesheet" type="text/css" href="styles/CSSStyle.CSS">
</head>

<!--- Set the month and year parameters to equal the current values if they do not exist. --->	
<CFPARAM NAME = "month" DEFAULT = "#DatePart('m', Now())#">
<CFPARAM NAME = "year" DEFAULT = "#DatePart('yyyy', Now())#">

<CFIF isDefined("url.month") IS 0>
	<CFSET url.month = "#DatePart('m', Now())#">
</CFIF>

<!--- Set the requested (or current) month/year date and determine the number of days in the month. --->
<CFSET ThisMonthYear = CreateDate(year, month, '1')>
<CFSET Days = DaysInMonth(ThisMonthYear)>

<!--- Set the values for the previous and next months for the back/next links. --->
<CFSET LastMonthYear = DateAdd('m', -1, ThisMonthYear)>
<CFSET LastMonth = DatePart('m', LastMonthYear)>
<CFSET LastYear = DatePart('yyyy', LastMonthYear)>

<CFSET NextMonthYear = DateAdd('m', 1, ThisMonthYear)>
<CFSET NextMonth = DatePart('m', NextMonthYear)>
<CFSET NextYear = DatePart('yyyy', NextMonthYear)>


<body bgcolor="C5B8B2" text="#423d3a" link="423d3a">
	<table class="DefFONT DefaultTable" cellspacing="0" border="0" align="center" width="755px">
		<tr>
			<td class="DefFONT LeftCol" valign="top" width="195" bgcolor="#6699cc">
				<table class="DefFONT LeftCol" cellspacing="0" width="195">
					<tr>
						<td class="DefFONT LeftCol" valign="top" width="">
							<form name="WebCalCat" method="post" action="default.asp?DoAction=Calendar&amp;View=Month&amp;Change=CatSelect">
							</form>
							<table cellpadding="3" cellspacing="0" width="100%" class="DefFONT LeftBLOCK CalCatNavig">
								<tr>
									<td width="100%" class="DefFONT LeftBLOCKHEADER CalCatNavigHead">	Category
									</td>
								</tr>
								<tr>
									<td width="100%" class="DefFONT LeftBLOCK CalCatNavig">
										<select style="width=90%" onChange="this.form.submit()" name="wcal_category">
											<option value="ALL">All categories</option>
											
										</select>
									</td>
								</tr>
							</table><font face="Verdana, Arial, Helvetica, sans-serif">
<br/></font>
							<form name="WebCalCat" method="post" action="default.asp?DoAction=Calendar&amp;View=Month&amp;Change=Location">
							</form>
							<table cellpadding="3" cellspacing="0" width="100%" class="DefFONT LeftBLOCK CalLocNavig">
								<tr>
									<td width="100%" class="DefFONT LeftBLOCKHEADER CalLocNavigHead">	Location
									</td>
								</tr>
								<tr>
									<td width="100%" class="DefFONT LeftBLOCK CalLocNavig">
										<select style="width=90%" onChange="this.form.submit()" name="wcal_loc">
											<option value="ALL">All locations</option>
											
										</select>
									</td>
								</tr>
							</table><font face="Verdana, Arial, Helvetica, sans-serif">
<br/></font>
							<form style="spacing-top:0px;spacing-bottom:0px;" action="default.asp?Search=1&amp;DoAction=Calendar&amp;View=Search" method="post" name="SearchAddress">
							</form>
							<table cellpadding="3" cellspacing="0" width="100%" class="DefFONT LeftBLOCK CalSearchNavig">
								<tr>
									<td width="100%" class="DefFONT LeftBLOCKHEADER CalSearchNavigHead">	Search for event
									</td>
								</tr>
								<tr>
									<td width="100%" class="DefFONT LeftBLOCK CalSearchNavig">
										<input size="8" type="text" name="SText">&nbsp;
										<input type="Submit" value="Search">
									</td>
								</tr>
							</table>
							<!-- Begin of month navigation --> 
							<table class="DefFONT LeftBLOCK CalDayNavig" width="100%" align="center" cellpadding="3" cellspacing="0">
								<tr>
									<td class="DefFONT LeftBLOCKHEADER CalDayNavigHEADER" colspan="2" valign="middle" align="left"><a class="DefFONT LeftBLOCKHEADER CalDayNavigHEADER" href="/calendar/default.asp?DoAction=Calendar&amp;View=Day&amp;MoveTo=7/14/2004">Today</a>
									</td>
									<td class="DefFONT LeftBLOCKHEADER CalDayNavigHEADER" colspan="6" valign="middle" align="right"><a href="/calendar/default.asp?DoAction=Calendar&amp;View=Month&amp;MoveTo=4/1/2004"><img alt="error-file:tidyout.log" width="11" height="11" src="images/previous.jpg" border="0"></a><a class="DefFONT LeftBLOCKHEADER CalDayNavigHEADER" href="/calendar/default.asp?DoAction=Calendar&amp;View=Month&amp;MoveTo=5/1/2004">May</a><a class="DefFONT LeftBLOCKHEADER CalDayNavigHEADER" href="/calendar/default.asp?DoAction=Calendar&amp;View=Year&amp;MoveTo=5/1/2004">2004</a><a href="/calendar/default.asp?DoAction=Calendar&amp;View=Month&amp;MoveTo=6/1/2004"><img alt="error-file:tidyout.log" width="11" height="11" src="images/next.jpg" border="0"></a>
									</td>
								</tr>
								<tr>
									<td width="12%">	&nbsp;
									</td>
									<td class="DefFONT LeftBLOCK CalDayNavig" align="center" width="12%">	S
									</td>
									<td class="DefFONT LeftBLOCK CalDayNavig" align="center" width="12%">	M
									</td>
									<td class="DefFONT LeftBLOCK CalDayNavig" align="center" width="12%">	T
									</td>
									<td class="DefFONT LeftBLOCK CalDayNavig" align="center" width="12%">	W
									</td>
									<td class="DefFONT LeftBLOCK CalDayNavig" align="center" width="12%">	T
									</td>
									<td class="DefFONT LeftBLOCK CalDayNavig" align="center" width="12%">	F
									</td>
									<td class="DefFONT LeftBLOCK CalDayNavig" align="center" width="12%">	S
									</td>
								</tr>
								<tr>
									<td class="DefFONT LeftBLOCK CalDayNavigWeekCol" height="25" valign="middle" align="right"><a title='View week' class="DefFONT LeftBLOCK CalDayNavig" style="text-decoration:none; background:none;" href="/calendar/default.asp?DoAction=Calendar&amp;MoveTo=4/25/2004&amp;View=Week"><img alt="error-file:tidyout.log" width="11" height="11" src="images/next.jpg" border="0"></a>
									</td>
									<td height="20" valign="middle" align="right" class="DefFONT LeftBLOCK CalDayOver"><a class="DefFONT LeftBLOCK CalDayOver" href="/calendar/default.asp?DoAction=Calendar&amp;MoveTo=4/25/2004&amp;View=Day">25</a>
									</td>
									<td height="20" valign="middle" align="right" class="DefFONT LeftBLOCK CalDayOver"><a class="DefFONT LeftBLOCK CalDayOver" href="/calendar/default.asp?DoAction=Calendar&amp;MoveTo=4/26/2004&amp;View=Day" title='There is an event on this day.'><strong>26</strong></a>
									</td>
									<td height="20" valign="middle" align="right" class="DefFONT LeftBLOCK CalDayOver"><a class="DefFONT LeftBLOCK CalDayOver" href="/calendar/default.asp?DoAction=Calendar&amp;MoveTo=4/27/2004&amp;View=Day">27</a>
									</td>
									<td height="20" valign="middle" align="right" class="DefFONT LeftBLOCK CalDayOver"><a class="DefFONT LeftBLOCK CalDayOver" href="/calendar/default.asp?DoAction=Calendar&amp;MoveTo=4/28/2004&amp;View=Day" title='There are 5 events on this day.'><strong>28</strong></a>
									</td>
									<td height="20" valign="middle" align="right" class="DefFONT LeftBLOCK CalDayOver"><a class="DefFONT LeftBLOCK CalDayOver" href="/calendar/default.asp?DoAction=Calendar&amp;MoveTo=4/29/2004&amp;View=Day" title='There are 5 events on this day.'><strong>29</strong></a>
									</td>
									<td height="20" valign="middle" align="right" class="DefFONT LeftBLOCK CalDayOver"><a class="DefFONT LeftBLOCK CalDayOver" href="/calendar/default.asp?DoAction=Calendar&amp;MoveTo=4/30/2004&amp;View=Day" title='There are 2 events on this day.'><strong>30</strong></a>
									</td>
									<td height="20" valign="middle" align="right" class="DefFONT LeftBLOCK CalDayNavig"><a class="DefFONT LeftBLOCK CalDayNavig" href="/calendar/default.asp?DoAction=Calendar&amp;MoveTo=5/1/2004&amp;View=Day">1</a>
									</td>
								</tr>
								<tr>
									<td class="DefFONT LeftBLOCK CalDayNavigWeekCol" height="25" valign="middle" align="right"><a title='View week' class="DefFONT LeftBLOCK CalDayNavig" style="text-decoration:none; background:none;" href="/calendar/default.asp?DoAction=Calendar&amp;MoveTo=5/2/2004&amp;View=Week"><img alt="error-file:tidyout.log" width="11" height="11" src="images/next.jpg" border="0"></a>
									</td>
									<td height="20" valign="middle" align="right" class="DefFONT LeftBLOCK CalDayNavig"><a class="DefFONT LeftBLOCK CalDayNavig" href="/calendar/default.asp?DoAction=Calendar&amp;MoveTo=5/2/2004&amp;View=Day" title='There is an event on this day.'><strong>2</strong></a>
									</td>
									<td height="20" valign="middle" align="right" class="DefFONT LeftBLOCK CalDayNavig"><a class="DefFONT LeftBLOCK CalDayNavig" href="/calendar/default.asp?DoAction=Calendar&amp;MoveTo=5/3/2004&amp;View=Day" title='There are 2 events on this day.'><strong>3</strong></a>
									</td>
									<td height="20" valign="middle" align="right" class="DefFONT LeftBLOCK CalDayNavig"><a class="DefFONT LeftBLOCK CalDayNavig" href="/calendar/default.asp?DoAction=Calendar&amp;MoveTo=5/4/2004&amp;View=Day" title='There are 5 events on this day.'><strong>4</strong></a>
									</td>
									<td height="20" valign="middle" align="right" class="DefFONT LeftBLOCK CalDayNavig"><a class="DefFONT LeftBLOCK CalDayNavig" href="/calendar/default.asp?DoAction=Calendar&amp;MoveTo=5/5/2004&amp;View=Day" title='There are 9 events on this day.'><strong>5</strong></a>
									</td>
									<td height="20" valign="middle" align="right" class="DefFONT LeftBLOCK CalDayNavig"><a class="DefFONT LeftBLOCK CalDayNavig" href="/calendar/default.asp?DoAction=Calendar&amp;MoveTo=5/6/2004&amp;View=Day" title='There are 16 events on this day.'><strong>6</strong></a>
									</td>
									<td height="20" valign="middle" align="right" class="DefFONT LeftBLOCK CalDayNavig"><a class="DefFONT LeftBLOCK CalDayNavig" href="/calendar/default.asp?DoAction=Calendar&amp;MoveTo=5/7/2004&amp;View=Day" title='There are 2 events on this day.'><strong>7</strong></a>
									</td>
									<td height="20" valign="middle" align="right" class="DefFONT LeftBLOCK CalDayNavig"><a class="DefFONT LeftBLOCK CalDayNavig" href="/calendar/default.asp?DoAction=Calendar&amp;MoveTo=5/8/2004&amp;View=Day">8</a>
									</td>
								</tr>
								<tr>
									<td class="DefFONT LeftBLOCK CalDayNavigWeekCol" height="25" valign="middle" align="right"><a title='View week' class="DefFONT LeftBLOCK CalDayNavig" style="text-decoration:none; background:none;" href="/calendar/default.asp?DoAction=Calendar&amp;MoveTo=5/9/2004&amp;View=Week"><img alt="error-file:tidyout.log" width="11" height="11" src="images/next.jpg" border="0"></a>
									</td>
									<td height="20" valign="middle" align="right" class="DefFONT LeftBLOCK CalDayNavig"><a class="DefFONT LeftBLOCK CalDayNavig" href="/calendar/default.asp?DoAction=Calendar&amp;MoveTo=5/9/2004&amp;View=Day">9</a>
									</td>
									<td height="20" valign="middle" align="right" class="DefFONT LeftBLOCK CalDayNavig"><a class="DefFONT LeftBLOCK CalDayNavig" href="/calendar/default.asp?DoAction=Calendar&amp;MoveTo=5/10/2004&amp;View=Day" title='There is an event on this day.'><strong>10</strong></a>
									</td>
									<td height="20" valign="middle" align="right" class="DefFONT LeftBLOCK CalDayNavig"><a class="DefFONT LeftBLOCK CalDayNavig" href="/calendar/default.asp?DoAction=Calendar&amp;MoveTo=5/11/2004&amp;View=Day" title='There are 4 events on this day.'><strong>11</strong></a>
									</td>
									<td height="20" valign="middle" align="right" class="DefFONT LeftBLOCK CalDayNavig"><a class="DefFONT LeftBLOCK CalDayNavig" href="/calendar/default.asp?DoAction=Calendar&amp;MoveTo=5/12/2004&amp;View=Day" title='There are 10 events on this day.'><strong>12</strong></a>
									</td>
									<td height="20" valign="middle" align="right" class="DefFONT LeftBLOCK CalDayNavig"><a class="DefFONT LeftBLOCK CalDayNavig" href="/calendar/default.asp?DoAction=Calendar&amp;MoveTo=5/13/2004&amp;View=Day" title='There are 16 events on this day.'><strong>13</strong></a>
									</td>
									<td height="20" valign="middle" align="right" class="DefFONT LeftBLOCK CalDayNavig"><a class="DefFONT LeftBLOCK CalDayNavig" href="/calendar/default.asp?DoAction=Calendar&amp;MoveTo=5/14/2004&amp;View=Day" title='There are 2 events on this day.'><strong>14</strong></a>
									</td>
									<td height="20" valign="middle" align="right" class="DefFONT LeftBLOCK CalDayNavig"><a class="DefFONT LeftBLOCK CalDayNavig" href="/calendar/default.asp?DoAction=Calendar&amp;MoveTo=5/15/2004&amp;View=Day">15</a>
									</td>
								</tr>
								<tr>
									<td class="DefFONT LeftBLOCK CalDayNavigWeekCol" height="25" valign="middle" align="right"><a title='View week' class="DefFONT LeftBLOCK CalDayNavig" style="text-decoration:none; background:none;" href="/calendar/default.asp?DoAction=Calendar&amp;MoveTo=5/16/2004&amp;View=Week"><img alt="error-file:tidyout.log" width="11" height="11" src="images/next.jpg" border="0"></a>
									</td>
									<td height="20" valign="middle" align="right" class="DefFONT LeftBLOCK CalDayNavig"><a class="DefFONT LeftBLOCK CalDayNavig" href="/calendar/default.asp?DoAction=Calendar&amp;MoveTo=5/16/2004&amp;View=Day">16</a>
									</td>
									<td height="20" valign="middle" align="right" class="DefFONT LeftBLOCK CalDayNavig"><a class="DefFONT LeftBLOCK CalDayNavig" href="/calendar/default.asp?DoAction=Calendar&amp;MoveTo=5/17/2004&amp;View=Day" title='There is an event on this day.'><strong>17</strong></a>
									</td>
									<td height="20" valign="middle" align="right" class="DefFONT LeftBLOCK CalDayNavig"><a class="DefFONT LeftBLOCK CalDayNavig" href="/calendar/default.asp?DoAction=Calendar&amp;MoveTo=5/18/2004&amp;View=Day" title='There are 2 events on this day.'><strong>18</strong></a>
									</td>
									<td height="20" valign="middle" align="right" class="DefFONT LeftBLOCK CalDayNavig"><a class="DefFONT LeftBLOCK CalDayNavig" href="/calendar/default.asp?DoAction=Calendar&amp;MoveTo=5/19/2004&amp;View=Day" title='There are 6 events on this day.'><strong>19</strong></a>
									</td>
									<td height="20" valign="middle" align="right" class="DefFONT LeftBLOCK CalDayNavig"><a class="DefFONT LeftBLOCK CalDayNavig" href="/calendar/default.asp?DoAction=Calendar&amp;MoveTo=5/20/2004&amp;View=Day" title='There are 13 events on this day.'><strong>20</strong></a>
									</td>
									<td height="20" valign="middle" align="right" class="DefFONT LeftBLOCK CalDayNavig"><a class="DefFONT LeftBLOCK CalDayNavig" href="/calendar/default.asp?DoAction=Calendar&amp;MoveTo=5/21/2004&amp;View=Day" title='There are 3 events on this day.'><strong>21</strong></a>
									</td>
									<td height="20" valign="middle" align="right" class="DefFONT LeftBLOCK CalDayNavig"><a class="DefFONT LeftBLOCK CalDayNavig" href="/calendar/default.asp?DoAction=Calendar&amp;MoveTo=5/22/2004&amp;View=Day" title='There are 2 events on this day.'><strong>22</strong></a>
									</td>
								</tr>
								<tr>
									<td class="DefFONT LeftBLOCK CalDayNavigWeekCol" height="25" valign="middle" align="right"><a title='View week' class="DefFONT LeftBLOCK CalDayNavig" style="text-decoration:none; background:none;" href="/calendar/default.asp?DoAction=Calendar&amp;MoveTo=5/23/2004&amp;View=Week"><img alt="error-file:tidyout.log" width="11" height="11" src="images/next.jpg" border="0"></a>
									</td>
									<td height="20" valign="middle" align="right" class="DefFONT LeftBLOCK CalDayNavig"><a class="DefFONT LeftBLOCK CalDayNavig" href="/calendar/default.asp?DoAction=Calendar&amp;MoveTo=5/23/2004&amp;View=Day" title='There is an event on this day.'><strong>23</strong></a>
									</td>
									<td height="20" valign="middle" align="right" class="DefFONT LeftBLOCK CalDayNavig"><a class="DefFONT LeftBLOCK CalDayNavig" href="/calendar/default.asp?DoAction=Calendar&amp;MoveTo=5/24/2004&amp;View=Day" title='There are 2 events on this day.'><strong>24</strong></a>
									</td>
									<td height="20" valign="middle" align="right" class="DefFONT LeftBLOCK CalDayNavig"><a class="DefFONT LeftBLOCK CalDayNavig" href="/calendar/default.asp?DoAction=Calendar&amp;MoveTo=5/25/2004&amp;View=Day" title='There are 3 events on this day.'><strong>25</strong></a>
									</td>
									<td height="20" valign="middle" align="right" class="DefFONT LeftBLOCK CalDayNavig"><a class="DefFONT LeftBLOCK CalDayNavig" href="/calendar/default.asp?DoAction=Calendar&amp;MoveTo=5/26/2004&amp;View=Day" title='There are 4 events on this day.'><strong>26</strong></a>
									</td>
									<td height="20" valign="middle" align="right" class="DefFONT LeftBLOCK CalDayNavig"><a class="DefFONT LeftBLOCK CalDayNavig" href="/calendar/default.asp?DoAction=Calendar&amp;MoveTo=5/27/2004&amp;View=Day" title='There are 12 events on this day.'><strong>27</strong></a>
									</td>
									<td height="20" valign="middle" align="right" class="DefFONT LeftBLOCK CalDayNavig"><a class="DefFONT LeftBLOCK CalDayNavig" href="/calendar/default.asp?DoAction=Calendar&amp;MoveTo=5/28/2004&amp;View=Day" title='There are 3 events on this day.'><strong>28</strong></a>
									</td>
									<td height="20" valign="middle" align="right" class="DefFONT LeftBLOCK CalDayNavig"><a class="DefFONT LeftBLOCK CalDayNavig" href="/calendar/default.asp?DoAction=Calendar&amp;MoveTo=5/29/2004&amp;View=Day" title='There is an event on this day.'><strong>29</strong></a>
									</td>
								</tr>
								<tr>
									<td class="DefFONT LeftBLOCK CalDayNavigWeekCol" height="25" valign="middle" align="right"><a title='View week' class="DefFONT LeftBLOCK CalDayNavig" style="text-decoration:none; background:none;" href="/calendar/default.asp?DoAction=Calendar&amp;MoveTo=5/30/2004&amp;View=Week"><img alt="error-file:tidyout.log" width="11" height="11" src="images/next.jpg" border="0"></a>
									</td>
									<td height="20" valign="middle" align="right" class="DefFONT LeftBLOCK CalDayNavig"><a class="DefFONT LeftBLOCK CalDayNavig" href="/calendar/default.asp?DoAction=Calendar&amp;MoveTo=5/30/2004&amp;View=Day">30</a>
									</td>
									<td height="20" valign="middle" align="right" class="DefFONT LeftBLOCK CalDayNavig"><a class="DefFONT LeftBLOCK CalDayNavig" href="/calendar/default.asp?DoAction=Calendar&amp;MoveTo=5/31/2004&amp;View=Day">31</a>
									</td>
									<td height="20" valign="middle" align="right" class="DefFONT LeftBLOCK CalDayOver"><a class="DefFONT LeftBLOCK CalDayOver" href="/calendar/default.asp?DoAction=Calendar&amp;MoveTo=6/1/2004&amp;View=Day" title='There are 6 events on this day.'><strong>1</strong></a>
									</td>
									<td height="20" valign="middle" align="right" class="DefFONT LeftBLOCK CalDayOver"><a class="DefFONT LeftBLOCK CalDayOver" href="/calendar/default.asp?DoAction=Calendar&amp;MoveTo=6/2/2004&amp;View=Day" title='There are 4 events on this day.'><strong>2</strong></a>
									</td>
									<td height="20" valign="middle" align="right" class="DefFONT LeftBLOCK CalDayOver"><a class="DefFONT LeftBLOCK CalDayOver" href="/calendar/default.asp?DoAction=Calendar&amp;MoveTo=6/3/2004&amp;View=Day" title='There are 8 events on this day.'><strong>3</strong></a>
									</td>
									<td height="20" valign="middle" align="right" class="DefFONT LeftBLOCK CalDayOver"><a class="DefFONT LeftBLOCK CalDayOver" href="/calendar/default.asp?DoAction=Calendar&amp;MoveTo=6/4/2004&amp;View=Day" title='There are 2 events on this day.'><strong>4</strong></a>
									</td>
									<td height="20" valign="middle" align="right" class="DefFONT LeftBLOCK CalDayOver"><a class="DefFONT LeftBLOCK CalDayOver" href="/calendar/default.asp?DoAction=Calendar&amp;MoveTo=6/5/2004&amp;View=Day">5</a>
									</td>
								</tr>
							</table>	<!-- End of month navigation -->
<br/>
<hr size="1" color="6699cc"><!-- Begin of Month navigation -->
							<table cellpadding="3" cellspacing="0" align="center" width="100%" class="DefFONT LeftBLOCK CalMonthNavig">
								<tr>
									<td align="center" width="28%" height="20" class="DefFONT LeftBLOCK CalMonthNavig"><a class="DefFONT LeftBLOCK CalMonthNavig" href="/calendar/default.asp?DoAction=Calendar&amp;View=Month&amp;MoveTo=1/1/2004" title='Go to January 2004'>Jan</a>
									</td>
									<td align="center" width="28%" height="20" class="DefFONT LeftBLOCK CalMonthNavig"><a class="DefFONT LeftBLOCK CalMonthNavig" href="/calendar/default.asp?DoAction=Calendar&amp;View=Month&amp;MoveTo=2/1/2004" title='Go to February 2004'>Feb</a>
									</td>
									<td align="center" width="28%" height="20" class="DefFONT LeftBLOCK CalMonthNavig"><a class="DefFONT LeftBLOCK CalMonthNavig" href="/calendar/default.asp?DoAction=Calendar&amp;View=Month&amp;MoveTo=3/1/2004" title='Go to March 2004'>Mar</a>
									</td>
								</tr>
								<tr>
									<td align="center" width="28%" height="20" class="DefFONT LeftBLOCK CalMonthNavig"><a class="DefFONT LeftBLOCK CalMonthNavig" href="/calendar/default.asp?DoAction=Calendar&amp;View=Month&amp;MoveTo=4/1/2004" title='Go to April 2004'>Apr</a>
									</td>
									<td align="center" width="28%" height="20" class="DefFONT LeftBLOCK CalMonthNavig"><a class="DefFONT LeftBLOCK CalMonthNavig" href="/calendar/default.asp?DoAction=Calendar&amp;View=Month&amp;MoveTo=5/1/2004" title='Go to May 2004'>May</a>
									</td>
									<td align="center" width="28%" height="20" class="DefFONT LeftBLOCK CalMonthNavig"><a class="DefFONT LeftBLOCK CalMonthNavig" href="/calendar/default.asp?DoAction=Calendar&amp;View=Month&amp;MoveTo=6/1/2004" title='Go to June 2004'>Jun</a>
									</td>
								</tr>
								<tr>
									<td align="center" width="28%" height="20" class="DefFONT LeftBLOCK CalMonthNavig"><a class="DefFONT LeftBLOCK CalMonthNavig" href="/calendar/default.asp?DoAction=Calendar&amp;View=Month&amp;MoveTo=7/1/2004" title='Go to July 2004'>Jul</a>
									</td>
									<td align="center" width="28%" height="20" class="DefFONT LeftBLOCK CalMonthNavig"><a class="DefFONT LeftBLOCK CalMonthNavig" href="/calendar/default.asp?DoAction=Calendar&amp;View=Month&amp;MoveTo=8/1/2004" title='Go to August 2004'>Aug</a>
									</td>
									<td align="center" width="28%" height="20" class="DefFONT LeftBLOCK CalMonthNavig"><a class="DefFONT LeftBLOCK CalMonthNavig" href="/calendar/default.asp?DoAction=Calendar&amp;View=Month&amp;MoveTo=9/1/2004" title='Go to September 2004'>Sep</a>
									</td>
								</tr>
								<tr>
									<td align="center" width="28%" height="20" class="DefFONT LeftBLOCK CalMonthNavig"><a class="DefFONT LeftBLOCK CalMonthNavig" href="/calendar/default.asp?DoAction=Calendar&amp;View=Month&amp;MoveTo=10/1/2004" title='Go to October 2004'>Oct</a>
									</td>
									<td align="center" width="28%" height="20" class="DefFONT LeftBLOCK CalMonthNavig"><a class="DefFONT LeftBLOCK CalMonthNavig" href="/calendar/default.asp?DoAction=Calendar&amp;View=Month&amp;MoveTo=11/1/2004" title='Go to November 2004'>Nov</a>
									</td>
									<td align="center" width="28%" height="20" class="DefFONT LeftBLOCK CalMonthNavig"><a class="DefFONT LeftBLOCK CalMonthNavig" href="/calendar/default.asp?DoAction=Calendar&amp;View=Month&amp;MoveTo=12/1/2004" title='Go to December 2004'>Dec</a>
									</td>
								</tr>
							</table>	<!--
							<table cellpadding="3" cellspacing="0" width="100%" class="DefFONT LeftBLOCK CalUserNavig">
								<tr>
									<td width="100%" class="DefFONT LeftBLOCKHEADER CalUserNavigHead">	Administration log-in
										<tr>
											<td width="100%" class="DefFONT LeftBLOCK CalUserNavig"><a class="DefFONT LeftBLOCK CalUserNavig" href="default.asp?DoAction=User&Change=LoginForm">Login</a>
<br/>
											</td>
										</tr>
										<tr>
											<td width="100%" class="DefFONT LeftBLOCK CalUserNavig"><a class="DefFONT LeftBLOCK CalUserNavig" href="default.asp?DoAction=User&Change=NewUser">New user</a>
<br/>
											</td>
										</tr>
										<tr>
											<td width="100%" class="DefFONT LeftBLOCK CalUserNavig"><a class="DefFONT LeftBLOCK CalUserNavig" href="default.asp?DoAction=User&Change=SendLoginInfo">Forgotten password</a>
<br/>
											</td>
										</tr>
										<tr>
											<td width="100%" class="DefFONT LeftBLOCK CalUserNavig"><a class="DefFONT LeftBLOCK CalUserNavig" href="default.asp?DoAction=Calendar&Change=UnSubscribe">&nbsp;</a>
<br/>
											</td>
										</tr>
							</table>	-->
						</td>
					</tr>
				</table><font face="Verdana, Arial, Helvetica, sans-serif"><img alt="error-file:tidyout.log" src='images/space.gif' height="1" width="195"></font>
			</td>	<!-- Middle part -->
			<td class="DefFONT MTTD" width="755px" valign="top"><font face="Verdana, Arial, Helvetica, sans-serif"></font>
				<table width="100%" border="0" class="DefFONT MT" cellpadding="5" cellspacing="0">
					<tr>
						<td width="100%" valign="top" class="DefFONT MTTD">
						</td>
					</tr>
					<tr>
						<td width="100%" height="250" valign="top" class="DefFONT MTTD"><font face="Verdana, Arial, Helvetica, sans-serif"><b>Events for:                        Monday, May 31, 2004</b></font>
							<table border="0" cellpadding="4" cellspacing="0" width="90%">
								<tr>
									<td colspan="2" height="30" valign="middle" align="left" class="DefFONT MT"><a class="DefFONT MTA" target="_blank" href='WCalPrint.asp?DoAction=Calendar&amp;View=Day&amp;MoveTo=5/31/2004'><img alt="error-file:tidyout.log" src='images/print.gif' border="0">Printer Friendly                                 Version</a>
									</td>
								</tr>
								<tr>
									<td>
									</td>
								</tr>
								<tr>
									<td align="left" valign="top" width="30%" class="DefFONT"><strong>Monday</strong>
<br/><a class="DefFONT MTA" href="/calendar/default.asp?DoAction=Calendar&amp;MoveTo=5/31/2004&amp;View=Day"><small>5/31/2004</small></a>
<br/>
									</td>
									<td valign="top" width="70%">
										<div class="DefFONT"><a class="DefFONT MTA" title='&lt;b&gt;Memorial Day&lt;/b&gt;' href="/calendar/default.asp?DoAction=Calendar&amp;MoveTo=5/31/2004&amp;View=Event&amp;IDEvent=3050"><b>Memorial Day</b></a>(10:00 AM-08:00                                    PM)&nbsp;&nbsp;&nbsp;All locations of The                                    Seattle Public Library will be closed                                    Monday, May 31 for the ...
<br/>Place: xxx Entire Library System xxx
<br/>Category: Holiday Closures</div>
<br/>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td width="100%" valign="top" class="DefFONT MTTD">
						</td>
					</tr>
				</table>
			</td>	
					
		</tr>
	</table>
</body>
</html>
