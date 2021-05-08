({
	getExpenses : function(component) {
        
        var action = component.get("c.getExpenses");
        
           action.setCallback(this,function(response){
            var state = response.getState();
               
            if(state==="SUCCESS" && component.isValid())
            {
                component.set("v.Expenses",response.getReturnValue());
               this.updatetotal(component);
            }
            
        });
        $A.enqueueAction(action);
		
	},
    updatetotal : function(component){
        
        var expenses = component.get("v.Expenses");
        var total =0;
        for(var i=0;i<expenses.length;i++)
        {
            var eitem = expenses[i];
            total+= eitem.Amount__c;
            
        }
       
        component.set('v.totalAmount',total);
        component.set('v.numberOfExpItems',expenses.length);
    }, //Delimiter for future code
   
    createExpense : function(component,expense){
    
        this.upsertExpense(component,expense,function(response){
            if(response.getState()==="SUCCESS"){
             		var expenselist= component.get('v.Expenses');
                    expenselist.push(response.getReturnValue);
                    component.set("v.Expenses",expenselist);
                    alert(response.getReturnValue.Amount__c);
                this.updatetotal(component);}
        });
    },
        upsertExpense:function(component,expense,callback)
        	{
             var saveexpenseaction = component.get("c.saveexpense");
            var Objasstring = JSON.stringify(expense);
			saveexpenseaction.setParams({newexpe:Objasstring});
                if(callback)
                saveexpenseaction.setCallback(this,callback);
                $A.enqueueAction(saveexpenseaction);  
        	}
           
        })
        
        
           
           
			
    		
             
        
          
        
        
    	
    },
 
    })