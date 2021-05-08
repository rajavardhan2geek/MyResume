({
	handleevent : function(component, event, helper) {
		console.log('grand parent  D '+event.getParam('message'));
		var timer= setTimeout(function(){component.set('v.parentD',"grand parent for event source"+event.getParam('message'))},4000);
	}
})