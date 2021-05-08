({
	doInit : function(component, event, helper) {
    	
		helper.getQuestionFields(component);
	},
      registerevent : function(component,event,helper) {
   
			
         var SampleEventProp =  $A.get("e.c:SampleEventProp");
          var target = event.getSource();
       	   SampleEventProp.setParams({
               "Question" : target.get("v.label"),
               "response"	: target.get("v.value")
          });
         var a= SampleEventProp.fire();
        console.log(a+' fired');
	},
    resetresponses :function(component, event, helper){
        
        
    },
    showToast : function(component, event, helper) {
    var toastEvent = $A.get("e.force:showToast");
        console.log(toastEvent);
    toastEvent.setParams({
        "title": "Success!",
        "message": "The record has been updated successfully."
    });
    toastEvent.fire();
},
     submitresponse : function(component,event,helper) {
         var findcomp = component.find('textboxes');
       		alert('hello');
         var formrespobj=[];
         for(i=0;i<findcomp.length;i++)
         {
         	
            	var question =findcomp[i].get('v.label');
                var response =findcomp[i].get('v.value');
                var events ={
                 Question__c:question,
                 Response__c:response ,
                 FormName__c:'a0U7F000000Qa0l'
             	};
             formrespobj.push(events);
               /*component.set('v.FormResponse.Question__c',question);
               component.set('v.FormResponse.Response__c',response);
             	component.set('v.FormResponse.FormName__c',"a0U7F000000Qa0l");*/
             	component.set('v.formresponses',formrespobj);
             
          		 
         }
    		console.log(component.get('v.formresponses'));
         var SampleEventProp = component.getEvent("sampleComponentEvent");
           
             		 SampleEventProp.setParams({
               				"formobjarray" : component.get('v.formresponses')
             
       			   }).fire();
    
     },
    showMyToast: function(component, event, helper) {
    var toastEvent = $A.get("e.force:showToast");
        console.log(toastEvent);	
    toastEvent.setParams({
        mode: 'sticky',
        message: 'This is a required message',
        messageTemplate: 'Record {0} created! See it {1}!',
        messageTemplateData: ['Salesforce', {
            url: 'http://www.salesforce.com/',
            label: 'here',
            }
        ]
    });
    toastEvent.fire();
}
})