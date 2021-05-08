({
    handleClick : function(component, event, helper) {
        var payload = {
            Sender: component.find('message').get('v.value'),
            Message:'Hello Lightning Component Bundle and VF Page'
        };
        component.find("sampleMessageChannel").publish(payload);
    },
    handleChanged:function(component,message,helper){
        console.log(JSON.stringify(message.getParams()));
        if (message != null && message.getParam("Sender") != null) {
            
             console.log(JSON.stringify(message.getParams().Sender));
        component.set("v.sender", message.getParams().Sender);
            console.log(component.get('v.sender'));
         component.set("v.message", message.getParams().Message);
            console.log(component.get('v.message'));
                     
    }
    }
})