({
    
      
	loadAccounts : function(component,recordid) {
		var action = component.get('c.getAccount');
        action.setParams({recordid:recordid});
        action.setCallback(this,function (response){
            if(response.getState()==='SUCCESS')
            {
                console.log('helper response'+response.getReturnValue());
                component.set('v.account',response.getReturnValue());
            }
        })
        $A.enqueueAction(action);
	},
	
	loadcontacts :function(component,recordId)
	{
	
		var action = component.get('c.getContacts');
    
        action.setParams({recordid:recordId});
        action.setCallback(this,function (response){
        
            if(response.getState()==='SUCCESS')
            {
                console.log('helper response'+JSON.stringify(response.getReturnValue()));
                component.set('v.contactList',response.getReturnValue());
            }
        })
        $A.enqueueAction(action);
	
	},
		loadOpportunities :function(component,recordId)
	{
	
		var action = component.get('c.getOpportunities');
    
        action.setParams({recordid:recordId});
        action.setCallback(this,function (response){
        
            if(response.getState()==='SUCCESS')
            {
                console.log('helper response'+JSON.stringify(response.getReturnValue()));
                component.set('v.OppList',response.getReturnValue());
            }
        })
        $A.enqueueAction(action);
	
	}
	
})