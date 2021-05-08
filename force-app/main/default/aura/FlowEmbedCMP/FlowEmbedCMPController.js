({
	init : function(component, event, helper) {
		  var flow = component.find("flowData");
        var inputVariables =[{name :'Total' ,value:123,type:'Number'}];
       flow.startFlow("Main_Flow",inputVariables);

	},
    handleStatusChange :function(component,event)
    {
          if(event.getParam("status") === "FINISHED") {
            
          	alert(JSON.stringify(event.getParam('outputVariables')));
              console.log((JSON.stringify(event.getParam('outputVariables'))));
              var flowvariables  = event.getParam('outputVariables');
              alert(flowvariables[1].value);
            if(flowvariables[1].value ===300 && flowvariables[1].name ==='Total')
              component.set('v.result',true);
          }
    }
})