<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>Untitled</title>
</head>

<body>

<!--- Run query on faculty/staff view using cleaned input.  Query first runs on people who have phone numbers, and then on people who don't.  --->

<CFQUERY NAME="read_swbd"
    DATASOURCE="read_swboard">

<!--- j	 --->

<!--- added couple of more columns to the select statement --->

SELECT FIRST_NAME, LAST_NAME, DEPARTMENT_LONG_NAME,JOB_CLASS_DESCRIPTION, UNIVERSAL_ID,COMPANY_CODE
FROM CUNVSWB.FIND_LOYOLANS_FACSTAFF FLFS
<!---WHERE PHONE_NO IS not NULL--->
WHERE first_name IS not NULL and COMPANY_CODE <> 151 and (JOB_CLASS_DESCRIPTION='Professor' OR JOB_CLASS_DESCRIPTION='Associate Professor' OR JOB_CLASS_DESCRIPTION='Assistant Professor')
group by DEPARTMENT_LONG_NAME,FIRST_NAME, LAST_NAME,JOB_CLASS_DESCRIPTION, UNIVERSAL_ID,COMPANY_CODE
order by DEPARTMENT_LONG_NAME, JOB_CLASS_DESCRIPTION DESC, LAST_NAME
</CFQUERY>

<cfoutput query="read_swbd" group="DEPARTMENT_LONG_NAME">(<strong>#DEPARTMENT_LONG_NAME#</strong>)<ul><cfoutput><li><a href="faculty_detail.cfm?universal_id=#UNIVERSAL_ID#">#first_name# #LAST_NAME#</a> (#JOB_CLASS_DESCRIPTION#-#COMPANY_CODE#)<br /></cfoutput></ul></cfoutput>
</body>
</html>
