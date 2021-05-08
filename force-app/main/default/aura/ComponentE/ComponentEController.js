({
	fireComponentEEvent : function(component, event, helper) {
		var cmpevent=component.getEvent('captureEvent');
		cmpevent.setParams({'message':"hello Subcomponent D"});
		cmpevent.fire();
	}
})