({
	handleeventhandler : function(component, event, helper) {
		console.log('parent for event source'+event.getName());
        var parentB = component.get('v.parentB');
       // component.set('v.parentB','parent for event source'+event.getParam('message'));
         var timer= setTimeout(function(){component.set('v.parentB'," parent for event source"+event.getParam('message'))},5000);
	},
	handleAppeventCMP:function(component, event, helper) {
	console.log('parent for event source'+event.getName());
	
	}
})