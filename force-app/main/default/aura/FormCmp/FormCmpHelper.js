({
	getQuestionFields : function(component) {
		var action  = component.get("c.getQuestionFields");
      

        action.setCallback(this,function(response){
            if(response.getState()==="SUCCESS")
                component.set('v.QuestionList',response.getReturnValue());
        });
       $A.enqueueAction(action); 
	}
    
	
})