/*
	>>> THIS IS CALENDAR TEMPLATE FILE <<<
	
	Variable defined here (CAL_TPL) should be passed to calendar constructor
	as second parameter.
	

	Notes:

	- Same template structure can be used for multiple
	calendar instances.
	- When specifying not numeric values for HTML tag attributes make sure you
	put them in apostrophes

*/

var CAL_TPL2 = {

	// >>> Localization settings <<<
	
	
	// months as they appear in the selection list
	'months': ['Jan', 'Feb', 'Mar', 'Apr', 'Mai', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dez'],

	// week day titles as they appear on the calendar
	'weekdays': ['So', 'Mo', 'Di', 'Mi', 'Do', 'Fr', 'Sa'],

	// day week starts from (normally 1-Mo or 0-Su)
	'weekstart': 1,
	
	// width of popup window (for Netscape 4.x only)
	'w': 190, 
	// height of popup window (for Netscape 4.x only)
	'h': 180,
	// start z-inxex - only for modal mode
	'startzindex': 0,
	// >>> Navbar settings <<<

	// in year selection box how many years to list relatively to current year
	'yearsbefore': 4,
	'yearsafter': 4,
		
		// >>> Appearence settings (HTML tags attributes) <<<

	// outer table (TABLE)
	'outertable': {
		'cellpadding': 3,
		'cellspacing': 0,
		'border': 0,
		'bgcolor' : 'black',
		'class' : 'calOuterTable',
		'width': 180
	},
	
	// not for on-page mode
	'calbutton': {
		'value': 'click to select date from the calendar'
	},
	
	// month & year navigation table (TABLE)
	'navtable': {
		'cellpadding': 0,
		'cellspacing': 0,
		'border': 0,
		'width': '100%'
	},
	// today icon cell (TD); if omited no today button will be displayed
	'todaycell': {
		'width': 10
	},
	// time navigation table (TABLE)
	'timetable': {
		'cellpadding': 0,
		'cellspacing': 1,
		'border': 0,
		'align': 'center',
		'class': 'calTimetable'
	},
	// pixel image (IMG)
	// for modal mode only
	'pixel': {
		'src': 'img/pixel.gif',
		'width': 1,
		'height': 1,
		'border' : 0		
	},
	// not for on-page mode
	'calbutton': {
		'value': 'click to select date from the calendar'
	},
	// icon image to open the calendar instance (IMG), 
	// not for on-page mode
	'caliconshow': {
		'src': 'img/cal.gif',
		'width': 16,
		'height': 16,
		'border' : 0,
		'alt': 'click to select date from the calendar'
	},
	// icon image to close the calendar instance (IMG)
	// for modal mode only
	'caliconhide': {
		'src': 'img/no_cal.gif'
	},
	// input text field to store the date & time selected (INPUT type="text")
	'datacontrol': {
		'width': 10,
		'maxlength': 50,
		'class': 'calDatCtrl'
	},
	// hour, minute & second selectors (SELECT)
	'timeselector': {
		'class': 'calCtrl'
	},
	// today icon image (IMG); if omited no today button will be displayed
	'todayimage': {
		'src': 'img/today.gif',
		'width': 10,
		'height': 20,
		'border': 0,
		'alt': 'reset to today'
	},
	// month scroll icon cell for alternative toolbar(TD)
	'monthscrollcellalt': {
		'width' : 13
	},
	// month scroll icon cell (TD)
	'monthscrollcell': {
		'width' : 10
	},
	// next hour image (IMG)
	'hourplusimage': {
		'src': 'img/plus.gif',
		'width': 10,
		'height': 10,
		'border': 0,
		'alt': 'scroll to next hour'
	},
	// previous hour image (IMG)
	'hourminusimage': {
		'src': 'img/minus.gif',
		'width': 10,
		'height': 10,
		'border': 0,
		'alt': 'scroll to previous hour'
	},
	// next minute image (IMG)
	'minplusimage': {
		'src': 'img/plus.gif',
		'width': 10,
		'height': 10,
		'border': 0,
		'alt': 'scroll to next minute'
	},
	// previous minute image (IMG)
	'minminusimage': {
		'src': 'img/minus.gif',
		'width': 10,
		'height': 10,
		'border': 0,
		'alt': 'scroll to previous minute'
	},
	// next second image (IMG)
	'secplusimage': {
		'src': 'img/plus.gif',
		'width': 10,
		'height': 10,
		'border' : 0,
		'alt': 'scroll to next second'
	},
	// previous second image (IMG)
	'secminusimage': {
		'src': 'img/minus.gif',
		'width': 10,
		'height': 10,
		'border' : 0,
		'alt': 'scroll to previous second'
	},
	// next month image (IMG)
	'monthplusimage': {
		'src': 'img/plus.gif',
		'width': 10,
		'height': 10,
		'border': 0,
		'alt': 'scroll to next month'
	},
	// next month image   for alternative toolba(IMG)
	'monthplusimagealt': {
		'src': 'img/plus_month.gif',
		'width': 13,
		'height': 13,
		'border': 0,
		'alt': 'scroll to next month'
	},
	// previous month image (IMG)
	'monthminusimage': {
		'src': 'img/minus.gif',
		'width': 10,
		'height': 10,
		'border': 0,
		'alt': 'scroll to previous month'
	},
	// previous month image  for alternative toolba(IMG)
	'monthminusimagealt': {
		'src': 'img/minus_month.gif',
		'width': 13,
		'height': 13,
		'border': 0,
		'alt': 'scroll to previous month'
	},
	// year scroll icon cell (TD)
	'yearscrollcell': {
		'width': 10
	},
	// year scroll icon cell for alternative toolbar(TD)
	'yearscrollcellalt': {
		'width': 13
	},
	// next year image (IMG)
	'yearplusimage': {
		'src': 'img/plus.gif',
		'width': 10,
		'height': 10,
		'border' : 0,
		'alt': 'scroll to next year'
	},
	// next year image for alternative toolbar(IMG)
	'yearplusimagealt': {
		'src': 'img/plus_year.gif',
		'width': 13,
		'height': 13,
		'border' : 0,
		'alt': 'scroll to next year'
	},
	// previous year image (IMG)
	'yearminusimage': {
		'src': 'img/minus.gif',
		'width': 10,
		'height': 10,
		'border' : 0,
		'alt': 'scroll to previous year'
	},
	// previous year image  for alternative toolbar(IMG)
	'yearminusimagealt': {
		'src': 'img/minus_year.gif',
		'width': 13,
		'height': 13,
		'border' : 0,
		'alt': 'scroll to previous year'
	},
	// next AM/PM image (IMG)
	'applusimage': {
		'src': 'img/plus.gif',
		'width': 10,
		'height': 10,
		'border': 0,
		'alt': 'scroll to AM'
	},
	// previous AM/PM image (IMG)
	'apminusimage': {
		'src': 'img/minus.gif',
		'width': 10,
		'height': 10,
		'border': 0,
		'alt': 'scroll to PM'
	},
	// inactive next image for alternative title (IMG)
	'disyearplusimagealt': {
		'src': 'img/plus_year_dis.gif',
		'width': 13,
		'height': 13,
		'border': 0
	},
	// inactive next image for alternative title (IMG)
	'disyearminusimagealt': {
		'src': 'img/minus_year_dis.gif',
		'width': 13,
		'height': 13,
		'border': 0
	},
	// inactive next image for alternative title (IMG)
	'dismonthplusimagealt': {
		'src': 'img/plus_month_dis.gif',
		'width': 13,
		'height': 13,
		'border': 0
	},
	// inactive next image for alternative title (IMG)
	'dismonthminusimagealt': {
		'src': 'img/minus_month_dis.gif',
		'width': 13,
		'height': 13,
		'border': 0
	},
	// inactive next image (IMG)
	'displusimage': {
		'src': 'img/plus_dis.gif',
		'width': 10,
		'height': 10,
		'border': 0
	},
	// inactive previous image (IMG)
	'disminusimage': {
		'src': 'img/minus_dis.gif',
		'width': 10,
		'height': 10,
		'border': 0
	},
	// month selector cell (TD)
	'monthselectorcell': {
		'width': '50px',
		'align': 'right'
	},
	// hour, minute & second scroll icon cell (TD)
	'timescrollcell': {
		'width': 10
	},
	// time selector cell (TD)
	'timeselectorcell': {
		'width': '50px',
		'align': 'right'
	},
	// month selector (SELECT)
	'monthselector': {
		'class': 'calCtrl'
	},
	// year selector cell (TD)
	'yearselectorcell': {
		'align': 'right'
	},
	// year selector (SELECT)
	'yearselector': {
		'class': 'calCtrl'
	},
	// cell containing calendar grid (TD)
	'gridcell': {},
	// calendar grid (TABLE)
	'gridtable': {
		'cellpadding': 2,
		'cellspacing': 0,
		'border': 0,
		'width': '100%'
	},
	// weekday title cell (TD)
	'wdaytitle': {
		'width': 20,
		'class': 'calWTitle'
	},
	// other month day text (A/SPAN)
	'dayothermonth': {
		'class': 'calOtherMonth'
	},
	// forbidden day text (A/SPAN)
	'dayforbidden': {
		'class': 'calForbDate'
	},
	// default day text (A/SPAN)
	'daynormal': {
		'class': 'calThisMonth'
	},
	// today day text (SPAN)
	'daytodaycell': {
		'style': 'border: dotted 2 red; width: 100%; margin: 0px;'
	},
	// selected day cell (TD)
	'dayselectedcell': {
		'align': 'center',
		'valign': 'middle',
		'class': 'calDayCurrent'
	},
	// wekend day cell (TD)
	'dayweekendcell': {
		'align': 'center',
		'valign': 'middle',
		'class': 'calDayWeekend'
	},
	// holiday day cell (TD)
	'daymarkedcell': {
		'align': 'center',
		'valign': 'middle',
		'class': 'calDayHoliday'
	},
	// working day cell (TD)
	'daynormalcell': {
		'align': 'center',
		'valign': 'middle',
		'class': 'calDayWorking'
	},
	'datatitle' : {
		'class': 'calDataTitle'
	},
	'datatitlecell' : {
		'align': 'center'
	}
};