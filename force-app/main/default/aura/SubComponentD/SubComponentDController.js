({
	handleevent : function(component, event, helper) {
	
	console.log('parent D :'+event.getParam('message'));
	//component.set('v.parentSub',"parent for event source"+event.getParam('message'));
	var timer= setTimeout(function(){component.set('v.parentSub'," parent for event source"+event.getParam('message'))},5000);
		
	}
})