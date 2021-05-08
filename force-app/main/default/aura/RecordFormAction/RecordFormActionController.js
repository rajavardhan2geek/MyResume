({
	doInit : function(component, event, helper) {
        console.log('init cmp ');
       var campsite =component.get('v.recordId');
        console.log(campsite);
		
        var action=component.get('c.getcampsites');
        
        action.setParams({
            'campsite':component.get('v.recordId')
        });
        console.log(action.getParams());
        action.setCallback(this,function(response){
            console.log('this' +response.getState());
        	if(response.getState()==='SUCCESS')
            {
                console.log(JSON.stringify(response.getReturnValue().Campsite_Reservations__r));
               // component.set('v.campsitereservations',response.getReturnValue().Campsite_Reservations__r);
           		  component.set('v.oppMap',response.getReturnValue());
                console.log('Opp Map'+ JSON.stringify(component.get('v.oppMap')));
            }
        });
        $A.enqueueAction(action);
       
	},
    showrecordForm:function(component,event,helper)
    {
        console.log(event.currentTarget.dataset.value);
        component.set('v.recId',event.currentTarget.dataset.value)
    }
})