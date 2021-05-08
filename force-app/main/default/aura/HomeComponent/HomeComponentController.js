({
	navigation : function(component, event, helper) {
        
         
        var appevent  = $A.get('e.c:Applicationevnt');
       	var navpat=event.target.getAttribute("data-record");
   			
        appevent.setParams({
            'message':navpat
                        })
        appevent.fire();
	
	}
})