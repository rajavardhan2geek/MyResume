({
	passmessage : function(component, event, helper) {
	
		var cmpev =component.getEvent('bubbleEvent');
		cmpev.setParams({"message" : event.getSource().get('v.name') });
		console.log('sdsd'+cmpev);
		cmpev.fire();
	},
	passAppEvent:function(component,event,helper){
	
	   var appevent = $A.get('e.c:Applicationevnt');
	   appevent.setParams({"message":event.getSource().get('v.name')});
	   appevent.fire();
	   
	
	}
})