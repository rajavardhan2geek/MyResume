({
    
    selecttab : function(component,event,helper)
    {
      
        var tabselected =component.get('v.selectedtab');
        var recordId=component.get("v.recordId");

        if(tabselected === 'accounts')
        	helper.loadAccounts(component,recordId);
        else if(tabselected === 'contacts')
        	helper.loadcontacts(component,recordId);
        else if(tabselected === 'opportunities')
        	helper.loadOpportunities(component,recordId);
        
    },
    doInit :function(component,event,helper)
    {
            var recid=component.get("v.recordId");
        	console.log(recid);
        	helper.loadAccounts(component,recid);
        
    },
	
  
 
})