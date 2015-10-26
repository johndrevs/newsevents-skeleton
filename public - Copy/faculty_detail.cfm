	

<cfoutput> 
    <!---  <BR>In dsp_Transfer_Results_Individual - What is the Value of the LID Being Passed ?  #form.passlid# ---> 
   
          
      <cfset session.from_pgm = "dsp_Transfer_Results_Individual"> 
      <cfset session.suppress_code = "yes">
     <!---  <cfmodule template="secure/dsp_Results_Individual.cfm" lid="#session.LID#">   --->
       <cfmodule template="dsp_Results_Individual.cfm" lid="#url.universal_id#"> 
 
</cfoutput> 
     <!---  <cfmodule template="dsp_Results_Individual.cfm" lid="#session.LID#"> --->
