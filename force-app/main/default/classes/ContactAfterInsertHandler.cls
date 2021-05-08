public with sharing class ContactAfterInsertHandler {
    public static Boolean stopConversion =false;
    public void mainEntry(List<Contact> newContacts){

        Set<Id> accountIdset = new Set<Id>();
        for(Contact newCont:newContacts){

            accountIdset.add(newCont.AccountId);
        }
        if(accountIdset.size()>0)
        updateAccount(accountIdset);

    }
    public void updateAccount( Set<Id> accountIdset){

        Map<Id,Account> accounttoUpdateMap = new Map<Id,Account>([select Id, NumberOfEmployees from Account where Id in :accountIdset]);
        for(Account newAccount :accounttoUpdateMap.values()){

            newAccount.NumberOfEmployees +=1;

        }
        if(accounttoUpdateMap.values().size()>0){
            update accounttoUpdateMap.values();
        }
        System.debug('contactId');
    }
}