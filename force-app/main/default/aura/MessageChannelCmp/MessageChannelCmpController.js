({
    handleMsg : function(component, message, helper) {
            console.log(message.getParam('sender'));
            console.log(message.getParam('payload'));
    }
})