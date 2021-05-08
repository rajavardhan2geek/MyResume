public class ContactBeforeInsertHandler {

    
    public void validateContacts(List<Contact> newContactList){
        
         for(Contact newContact:newContactList){
             if(newContact.Phone == null){
                 newContact.addError('Phone Should be Populated');}
         }
    }
     public void prePopulateContacts(List<Contact> newContactList){
         Set<Id> accId=new Set<Id>();
         List<Contact> contlist=new List<Contact>();
         for(Contact newContact:newContactList){
             
             if(newContact.AccountId !=null){
               	accId.add(newContact.AccountId);
                 newContact.Birthdate=populateLastDate(newContact.AccountId,newContact);
             }
         }
         
        
    }
    
    private Date populateLastDate(Id Accid,Contact newContact){
        Account acc=[select Id,Started_Date__c from Account where id =:Accid limit 1];
        return acc.Started_Date__c;
    }
}