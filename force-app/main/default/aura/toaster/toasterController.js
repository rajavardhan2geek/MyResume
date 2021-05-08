({
	
    fireToastEvent : function(component, event, helper) {
        var toastEvent = $A.get("e.force:showToast");
        toastEvent.setParams({
            "title": "Success!",
            "message": "It works!",
            "type": "success"
        });
        toastEvent.fire();
    }

})