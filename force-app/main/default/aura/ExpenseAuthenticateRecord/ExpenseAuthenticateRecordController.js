({

    onInit: function(component,event,helper){
            var recId=component.get('v.recordId');
        console.log(' init recod'+recId);
        var workspaceAPI = component.find("expenseTab");
        workspaceAPI.openSubtab({
            url: '#/sObject/'+recId+'/view',
            focus: true
        });

    },
    authenticate : function(component, event, helper) {
        var recId=component.get('v.recordId');
         var getRecordaction= component.get('c.getExpenses');
         getRecordaction.setParams({'recordId':recId});
         getRecordaction.setCallback(this,function(response){

            if(response.getState()==="SUCCESS"){
                let parentObj=response.getReturnValue();
                var workspaceAPI = component.find("expenseTab");
                workspaceAPI.getFocusedTabInfo().then(function(response2){
        
                    workspaceAPI.openSubtab({
                        parentTabId:response2.tabId,
                        url: '#/sObject/'+parentObj.Current_Month__c+'/view',
                        focus: true
                    });
        
                }).catch(function(error){console.log('errror'+error)});

            }


         });
         $A.enqueueAction(getRecordaction);
       
       
    },
    
})
