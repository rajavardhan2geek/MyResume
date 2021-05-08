({
	handleevent : function(component, event, helper) {
		console.log("Grand parent handler A"+ event.getName());
      //  var parentB = component.get('v.parentA');
       // component.set('v.parentA','Grand parent handler A'+event.getParam('message'));
        var timer= setTimeout(function(){component.set('v.parentA'," grand parent for event source"+event.getParam('message'))},5000);
	},
	handleAppevent:function(component, event, helper) {
	
	console.log('App Event Fired'+event.getParam('message'));
	}
})