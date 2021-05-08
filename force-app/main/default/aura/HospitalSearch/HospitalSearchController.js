({
    doInit : function(component, event, helper) {
       
        var action = component.get("c.getallHospital");
        console.log(''+action);
        action.setCallback(this,function(response){
            var state = response.getState();
         
            if(state==="SUCCESS"){
                component.set('v.hospitals',response.getReturnValue());
               // console.log(''+response.getReturnValue());
               // helper.showToastItem();
            }
            
        });
        $A.enqueueAction(action);
        
    },
    
    handleSearch:function(component,event,helper){
         var catgry = component.find('searchStr').get('v.value');
         var action = component.get("c.getSuperHosp");
        action.setParams({"category": catgry});
        console.log('success'+catgry);
          action.setCallback(this,function(response){
              var state = response.getState();
              
              if(state==="SUCCESS"){
                  component.set('v.hospitals',response.getReturnValue());
                  console.log(''+response.getReturnValue());
                  // helper.showToastItem();
                  } 	
          		});
            $A.enqueueAction(action);
    		
    
    },
    
})