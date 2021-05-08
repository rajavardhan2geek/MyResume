({
    onClick : function(component, event, helper) {
        var id = event.target.dataset.menuItemId;
        if (id) {
            component.getSuper().navigate(id);
         }
   },
   navigateToUrl:function(component, event, helper) {
    var menuValue = event.detail.menuItem.get("v.value");
    if(menuValue=='About Me'){
        var urlEvent = $A.get("e.force:navigateToURL");
        urlEvent.setParams({
            "url": "/resume"
        });
    
        urlEvent.fire();
    }
    console.log(menuValue);
   }
})