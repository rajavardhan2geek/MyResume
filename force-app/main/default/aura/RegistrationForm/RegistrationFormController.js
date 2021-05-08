({
	
    getcomponent : function(component, event, helper) {
		var msg =event.getParam('message');
        console.log('root reg handler' +msg);
	},
    navigateToView : function(component, event, helper) {
        var destination = "c:" + event.getParam("message") ;
 		console.log("component name: "+destination );
        $A.createComponent(destination,{},function(newComponent, status, statusDetail){
            console.log("sucess: " +status);
             if (status === "SUCCESS") 
             {var content = component.find("displayPort");
                content.set("v.body", newComponent);
             }
            else if(status==='ERROR')
            console.log("Error: "+statusDetail );

        } );
    },
    handleformresp:function(component, event, helper) {
    		var  formrespobj =event.getParam("formobjarray");
				console.log('component event '+event.getName());            
                component.set('v.formresparr',formrespobj);
    			 
        	helper.getResponsefields(component);
    }
})