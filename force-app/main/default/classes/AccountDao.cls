public without sharing  class AccountDao {
    
    @AuraEnabled
    public static Account getAccount(String recordid)
    {
        return [select Name,AccountNumber from Account where Id=:recordid ];
    }


   @AuraEnabled
    public static List<Contact> getContacts(String recordid)
    {
        return [select Id,Name,Product__c,AccountId,Preferred_Contact__c,LastCURequestDate,Birthdate from Contact  where AccountId=:recordid ];
    }
    
      @AuraEnabled
    public static List<Opportunity> getOpportunities(String recordid)
    {
        return [select Id,Name,AccountId,CloseDate,StageName from Opportunity  where AccountId=:recordid ];
    }
}