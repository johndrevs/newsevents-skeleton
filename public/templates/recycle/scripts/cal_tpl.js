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

var CAL_TPL = {

	// >>> Localization settings <<<
	
	
	// months as they appear in the selection list
	'months': ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],

	// week day titles as they appear on the calendar
	'weekdays': ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa'],

	// day week starts from (normally 1-Mo or 0-Su)
	'weekstart': 1,
	
	// width of popup window (for Netscape 4.x only)
	'w': 190, 
	// height of popup window (for Netscape 4.x only)
	'h': 180,
	// start z-inxex - only for modal mode
	'startzindex': 0,
	// >>> Navbar settings <<<

	// in year selection box how many years to list relative to current year
	'yearsbefore': 4,
	'yearsafter': 4,
	
	// >>> Appearence settings (HTML tags attributes) <<<

	// outer table (TABLE)
	'outertable': {
		'cellpadding': 1,
		'cellspacing': 0,
		'border': 1,
		'bgcolor': '#ffffff',
		'width': 180
	},
	// month & year navigation table (TABLE)
	'navtable': {
		'cellpadding': 0,
		'cellspacing': 0,
		'border': 1,
		'width': '100%'
	},
	// today icon cell (TD); if omited no today button will be displayed
	'todaycell': {
		'width' : 10
	},
	// time navigation table (TABLE)
	'timetable': {
		'cellpadding': 0,
		'cellspacing': 0,
		'border': 1,
		'width': '100%',
		'class' : 'calTimetable'
	},
	// pixel image (/newsevents/images)
	// for modal mode only
	'pixel': {
		'src': '/newsevents/images/pixel.gif',
		'width': 1,
		'height': 1,
		'border' : 0		
	},
	// not for on-page mode
	'calbutton': {
		'value': 'click to select date from the calendar'
	},
	
	// icon image to open the calendar instance (/newsevents/images), 
	// not for on-page mode
	
	'caliconshow': {
		'src': '/newsevents/images/cal.gif',
		'width': 16,
		'height': 16,
		'border' : 0,
		'alt': 'click to select date from the calendar'
	},
	// icon image to close the calendar instance (/newsevents/images)
	// for modal mode only
	'caliconhide': {
		'src': '/newsevents/images/no_cal.gif',
		'width': 16,
		'height': 16,
		'border' : 0,
		'alt': 'click to select date from the calendar'
	},
	// input text field to store the date & time selected (INPUT type="text")
	'datacontrol': {
		'width': 10,
		'maxlength' :100,
		'class' : 'calDatCtrl'
	},
	// hour, minute & second selectors (SELECT)
	'timeselector': {
		'class' : 'calTimeselector'
	},
	// today icon image (/newsevents/images); if omited no today button will be displayed
	'todayimage': {
		'src': '/newsevents/images/today.gif',
		'width': 10,
		'height': 20,
		'border' : 0,
		'alt': 'reset to today'
	},
	// month scroll icon cell (TD)
	'monthscrollcell': {
		'width' : 10
	},
	// next hour image (/newsevents/images)
	'hourplusimage': {
		'src': '/newsevents/images/plus.gif',
		'width': 10,
		'height': 10,
		'border' : 0,
		'alt': 'scroll to next hour'
	},
	// previous hour image (/newsevents/images)
	'hourminusimage': {
		'src': '/newsevents/images/minus.gif',
		'width': 10,
		'height': 10,
		'border' : 0,
		'alt': 'scroll to previous hour'
	},
	// next minute image (/newsevents/images)
	'minplusimage': {
		'src': '/newsevents/images/plus.gif',
		'width': 10,
		'height': 10,
		'border' : 0,
		'alt': 'scroll to next minute'
	},
	// previous minute image (/newsevents/images)
	'minminusimage': {
		'src': '/newsevents/images/minus.gif',
		'width': 10,
		'height': 10,
		'border' : 0,
		'alt': 'scroll to previous minute'
	},
	// next second image (/newsevents/images)
	'secplusimage': {
		'src': '/newsevents/images/plus.gif',
		'width': 10,
		'height': 10,
		'border' : 0,
		'alt': 'scroll to next second'
	},
	// previous second image (/newsevents/images)
	'secminusimage': {
		'src': '/newsevents/images/minus.gif',
		'width': 10,
		'height': 10,
		'border' : 0,
		'alt': 'scroll to previous second'
	},
	// next month image (/newsevents/images)
	'monthplusimage': {
		'src': '/newsevents/images/plus.gif',
		'width': 10,
		'height': 10,
		'border' : 0,
		'alt': 'scroll to next month'
	},
	// previous month image (/newsevents/images)
	'monthminusimage': {
		'src': '/newsevents/images/minus.gif',
		'width': 10,
		'height': 10,
		'border' : 0,
		'alt': 'scroll to previous month'
	},
	// year scroll icon cell (TD)
	'yearscrollcell': {
		'width' : 10
	},
	// next year image (/newsevents/images)
	'yearplusimage': {
		'src': '/newsevents/images/plus.gif',
		'width': 10,
		'height': 10,
		'border' : 0,
		'alt': 'scroll to next year'
	},
	// previous year image (/newsevents/images)
	'yearminusimage': {
		'src': '/newsevents/images/minus.gif',
		'width': 10,
		'height': 10,
		'border' : 0,
		'alt': 'scroll to previous year'
	},
	// next AM/PM image (/newsevents/images)
	'applusimage': {
		'src': '/newsevents/images/plus.gif',
		'width': 10,
		'height': 10,
		'border' : 0,
		'alt': 'scroll to AM'
	},
	// previous AM/PM image (/newsevents/images)
	'apminusimage': {
		'src': '/newsevents/images/minus.gif',
		'width': 10,
		'height': 10,
		'border' : 0,
		'alt': 'scroll to PM'
	},
	
	
	
		// inactive next image for alternative title (/newsevents/images)
	'disyearplusimagealt': {
		'src': '/newsevents/images/plus_year_dis.gif',
		'width': 13,
		'height': 13,
		'border': 0
	},
	// inactive next image for alternative title (/newsevents/images)
	'disyearminusimagealt': {
		'src': '/newsevents/images/minus_year_dis.gif',
		'width': 13,
		'height': 13,
		'border': 0
	},
	// inactive next image for alternative title (/newsevents/images)
	'dismonthplusimagealt': {
		'src': '/newsevents/images/plus_month_dis.gif',
		'width': 13,
		'height': 13,
		'border': 0
	},
	// inactive next image for alternative title (/newsevents/images)
	'dismonthminusimagealt': {
		'src': '/newsevents/images/minus_month_dis.gif',
		'width': 13,
		'height': 13,
		'border': 0
	},
	// next month image   for alternative toolba(/newsevents/images)
	'monthplusimagealt': {
		'src': '/newsevents/images/plus_month.gif',
		'width': 13,
		'height': 13,
		'border': 0,
		'alt': 'scroll to next month'
	},
	// previous month image  for alternative toolba(/newsevents/images)
	'monthminusimagealt': {
		'src': '/newsevents/images/minus_month.gif',
		'width': 13,
		'height': 13,
		'border': 0,
		'alt': 'scroll to previous month'
	},
	// next year image for alternative toolbar(/newsevents/images)
	'yearplusimagealt': {
		'src': '/newsevents/images/plus_year.gif',
		'width': 13,
		'height': 13,
		'border' : 0,
		'alt': 'scroll to next year'
	},
	// previous year image  for alternative toolbar(/newsevents/images)
	'yearminusimagealt': {
		'src': '/newsevents/images/minus_year.gif',
		'width': 13,
		'height': 13,
		'border' : 0,
		'alt': 'scroll to previous year'
	},
	'datatitle' : {
		'class': 'calDataTitle'
	},
	
	
	
	
	// inactive next image (/newsevents/images)
	'displusimage': {
		'src': '/newsevents/images/plus_dis.gif',
		'width': 10,
		'height': 10,
		'border' : 0
	},
	// inactive previous image (/newsevents/images)
	'disminusimage': {
		'src': '/newsevents/images/minus_dis.gif',
		'width': 10,
		'height': 10,
		'border' : 0
	},
	// month selector cell (TD)
	'monthselectorcell': {
		'width': '50px',
		'align': 'right'
	},
	// hour, minute & second scroll icon cell (TD)
	'timescrollcell': {
		'width' : 10
	},
	// time selector cell (TD)
	'timeselectorcell': {
		'width': '50px',
		'align': 'right'
	},
	// month selector (SELECT)
	'monthselector': {
		'class': 'calMonthselector'
	},
	// year selector cell (TD)
	'yearselectorcell': {
		'align': 'right'
	},
	// year selector (SELECT)
	'yearselector': {
		'class': 'calYearselector'
	},
	// cell containing calendar grid (TD)
	'gridcell' : {},
	// calendar grid (TABLE)
	'gridtable': {
		'cellpadding': 2,
		'cellspacing': 1,
		'border': 0,
		'width': '100%'
	},
	// week day title cell (TD)
	'wdaytitle' : {
		'width' : 20,
		'class' : 'calWTitle'
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
		'style' : 'border: dotted 2 red; width: 100%; margin: 0px;'
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
	// marked day cell (TD)
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
	}
};