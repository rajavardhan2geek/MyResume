public class ESBBatchQueue implements Queueable {
    
    public List<ESB_Inbound_Queue__c> incomingRecords;
    public ESBBatchQueue(List<ESB_Inbound_Queue__c> incomingRecords){
        
        this.incomingRecords=incomingRecords;
    }
    public void execute(QueueableContext context) {
        
        for(ESB_Inbound_Queue__c inboundRecord: incomingRecords){
            Account a = new Account(Name='Test');
            insert a;
            System.debug(' queue job'+inboundRecord);
        }
       
        
    }

}