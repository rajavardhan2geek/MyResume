({
	doInit : function(component, event, helper) {
		         
		component.set('v.recId',component.get("v.pageReference").state.c__recordId);
       /* component.find('navService').navigate({
              type: 'standard__webPage',
            attributes: {
                "url" :"https://www.google.com"
            }
        });
     */
	        component.find('navService').navigate({
            
            type:'standard__objectPage',
            attributes:{
                objectApiName:'Opportunity',
                actionName:'edit',
                recordId:component.get('v.recId')
            }
        })
	}
})