({

    getResponsefields :function(component){
     var action = component.get("c.setFormRespObj");
    
        action.setParams({
            "formresponse":JSON.stringify(component.get("v.formresparr"))
           
        });
        console.log('component'+component.get("v.formresparr"));
        action.setCallback(this,function(response){
              console.log(response.getState());
              if(response.getState()==="SUCCESS")
              {component.set('v.msg',response.getReturnValue());
              	console.log(response.getReturnValue())
              }
             if(response.getState()==="ERROR")
             {    var errors =response.getError();
                     component.set('v.msg',errors[0].message);
              		console.log(errors[0].message);}
        });
     	 $A.enqueueAction(action); 
    
             
	}
       
})