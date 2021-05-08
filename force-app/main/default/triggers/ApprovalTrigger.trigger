trigger ApprovalTrigger on Approval_Matrix__c (before insert,before update) {
	
    Database.DMLOptions  dmloptions=new Database.DMLOptions();
    for(Approval_Matrix__c app:Trigger.new){
        
       
    }
    dmloptions.EmailHeader.triggerAutoResponseEmail =false;
    
}