({

 displayToast : function (component, event, helper) {
    var toast = $A.get("e.force:showToast");
    if (toast){
        console.log(toast);
        //fire the toast event in Salesforce1 and Lightning Experience
        toast.setParams({
            "title": "Success!",
            "message": "The component loaded successfully.",
            "duration": "5000"
        });
        toast.fire();
       
    } else {
		console.log('fdf');
    }
}
    
})