({
	handlesampleevnt : function(component, event, helper) {
     
	//	var evnt = component.getEvent("SampleEventProp");
      
        var question=event.getParam("Question");
        var resp1=event.getParam("response");
        
       
        component.set("v.msg",question);
        component.set("v.message",resp1);
      //	helper.getResponsefields(component);
      
	},
    handleformresp:function(component, event, helper) {
    		var  formrespobj =event.getParam("formobjarray");
				console.log('component event '+event.getName());            
                component.set('v.formresparr',formrespobj);
    			 
        	helper.getResponsefields(component);
    }
    
})