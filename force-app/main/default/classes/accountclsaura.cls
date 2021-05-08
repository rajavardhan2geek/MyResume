public without sharing  class accountclsaura {
    
    @AuraEnabled
    public static Account getAccount(String recordid)
    {
        return [select Name,AccountNumber from Account where Id=:recordid limit 1];
    }

}