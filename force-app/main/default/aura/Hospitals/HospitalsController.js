({
	searchAccounts : function(component, event, helper) {
		var searchKey = component.find('searchKey').get('v.value');
        var OBJNAME = component.get('v.objectname');
        var FIELDNAME = component.get('v.fname');
         console.log('success'+OBJNAME+" filed"+FIELDNAME+'sea'+searchKey);
        var action = component.get("c.getAccounts");
       
      action.setParams({
            'objname':OBJNAME,
          	'fname':FIELDNAME,
            
        });
        //console.log('success'+OBJNAME+" field Name is "+FIELDNAME+getAccAction);
         action.setCallback(this,function(response){
              var state = response.getState();
             
              if(state==='SUCCESS'){
                  component.set('v.itemlst',JSON.parse(response.getReturnValue()));
                  console.log('iemlis'+component.get('v.itemlst'));
                  //console.log('SUCCESS'+response.getReturnValue()+' '+response.getState());
                  }
             else
                 console.log(state);
          		});
        		
            $A.enqueueAction(action);
	}
})