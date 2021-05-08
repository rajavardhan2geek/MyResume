({
   init : function (component) {
      // Find the component whose aura:id is "flowData"
      var flow = component.find("flowData");
      var inputVariables =[{recordId:'0067F00000IfEFw'}];
       flow.startFlow("firstFlow");
   },
    // init function here
handleStatusChange : function (component, event) {
   if(event.getParam("status") === "FINISHED") {
       
       var navigateent = $A.get('e.force:navigateToSObject');
       navigateent.setParams({
           'recordId' :'0067F00000IfEFw',
           'isredirect':'true'
       });
       navigateent.fire();
       
    }
}
})