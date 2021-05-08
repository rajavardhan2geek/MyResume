({
	utteranceHandler : function(component, event, helper) {
        if(event.keyCode!==13){
            return ;
        }
        
		var utterance = event.target.value;
        var messages=component.get('v.messages');
        messages.push({author:"Raja",messageText:utterance});
        component.set('v.messages',messages);
        helper.submit(component,event,utterance ,function(answer){
          
                //Array.prototype.push.apply(messages, answer[0].messagetext);
              // for(var i=0;i<answer.length;i++)
                   messages.push({author:answer.author,messageText:answer.messagetext,msgs:answer.msgs});
                component.set("v.messages",messages);
            
            
         
        });
        
        
        
        
     
	}
})