trigger ESBInboundQueueTrigger on ESB_Inbound_Queue__c (before insert,after insert) {

    if(Trigger.isInsert && Trigger.isBefore){
        
            esbBatchCheck__c esbSetting= esbBatchCheck__c.getInstance('ESBBatchRunning');
            if(esbSetting!= null && esbSetting.esbBatchId__c != null){
            
                esbSetting.esbBatchStartedById__c=null;
                esbSetting.esbBatchId__c=null;
                Database.update(esbSetting);
            
            }
        
        
    }
   
    else if(Trigger.isInsert && Trigger.isAfter){
         List<ESB_Inbound_Queue__c> pendingESBs = new List<ESB_Inbound_Queue__c>();
        for(ESB_Inbound_Queue__c esbrecord:Trigger.new){
            
            if(esbrecord.Status__c=='Pending'){
                
                pendingESBs.add(esbrecord);
                
                
            }
            
        }
        
      //  esbBatchCheck__c esbSetting= esbBatchCheck__c.getInstance('ESBBatchRunning');
      //  && esbSetting!= null && esbSetting.esbBatchId__c ==null
        if(pendingESBs.size()>0 ){
            System.enqueueJob(new ESBBatchQueue(pendingESBs));
           /// String batchId=Database.executeBatch(new EnqueueBatch(),1);
          //  esbSetting.esbBatchId__c=batchId;
           // Database.update(esbSetting);
        }
    }
}