({
    
    doInit:function(component,event){
          var action = component.get("c.getAccount");
       
     
        //console.log('success'+OBJNAME+" field Name is "+FIELDNAME+getAccAction);
         action.setCallback(this,function(response){
              var state = response.getState();
             console.log('iemlis'+JSON.stringify(response.getReturnValue()));
              if(state==='SUCCESS'){
                  
                  //console.log('SUCCESS'+response.getReturnValue()+' '+response.getState());
                  }
             else
                 console.log(state);
          		});
        		
            $A.enqueueAction(action);
      
    },
    
   
    
    
})