public class EnqueueBatch  implements Database.Batchable<sObject>,Database.Stateful {
	public  List<ESB_Inbound_Queue__c> processedQueueList= new List<ESB_Inbound_Queue__c>();
    public  Database.QueryLocator start(Database.BatchableContext bc){
       
        return Database.getQueryLocator([select Id,Body__c,Status__c from ESB_Inbound_Queue__c where Status__c='Pending']);
    }
    public  void execute(Database.BatchableContext bc,List<ESB_Inbound_Queue__c> queueRecords){
       
        for(ESB_Inbound_Queue__c inboundqueue:queueRecords){
            
            
            inboundqueue.Status__c='Completed';
            processedQueueList.add(inboundqueue);
        }
    }
    public void finish(Database.BatchableContext bc)
    {
        
        Database.update(processedQueueList);
        System.debug(bc.getJobId()+'batch job id');
       
    }
          
}