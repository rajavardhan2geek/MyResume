({
    startFlow : function(component, event, helper) {
        var flow = component.find("expensesFlow");
        flow.startFlow("expenses_Tracker");
    },
    statusChange:function(component,event){
        if (event.getParam('status') === "FINISHED") {
            //Do something
            }
    }
})
