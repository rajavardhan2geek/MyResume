({
	  submit : function(component,event,params,callback) {
		 
          var messages ={};
          var action= component.get('c.submit');
          action.setParams({
              utterance:params
          });
          console.log(action);
          action.setCallback(this,function(response){
              				var state=response.getState();
              			   if(state==='SUCCESS')
                              callback( response.getReturnValue());
              			   if(state==='ERROR')
                           {
                               var errinff = response.getError();
                                console.log(errinff);
                               if(errinff) console.log(errinff[0].message);
                           }
              			else if (state === "INCOMPLETE") {
							console.log("Incomplete");
            			}
                                       });
          
          $A.enqueueAction(action);
          
          
	}
})