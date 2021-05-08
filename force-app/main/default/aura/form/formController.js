({
	doInit : function(component, event, helper) {
         
		helper.getExpenses(component);
	},
    
    getTotalExpenses:function(component, event, helper){
        helper.getExpenses(component);
    },
    createExpense : function(component, event, helper){
        
        // validate fields here and call helper function to generate resp and sentback  to client
         var amtField = component.find("amt");
         var amt = amtField.get("v.value");
       
    if (isNaN(amt)||amt==''){
        amtField.set("v.errors", [{message:"Enter an expense amount."}]);
    }
        else{
            amtField.set("v.errors", null);
            var newexpenses = component.get("v.NewExpenses");
            helper.createExpense(component,newexpenses);
            }
    },
    
   
    updateEvent : function(component, event, helper) {
    helper.upsertExpense(component, event.getParam("expense"));
}
})
    
    
})