public without sharing  class AccountContrl {

    @AuraEnabled
    public static List<Account> getAccount(){
        List<Account> accList=[select Id ,AU__c from Account where AU__c ='12345'];
        return accList;
    }
}