public with sharing class AccountBeforeInsertHelper {

    public static Boolean stopConversion =false;
    public void mainEntry(List<Account> newAccountList){

        List<Account> accUpdateList= new List<Account>();
        for(Account newAccount:newAccountList){

            accUpdateList.add(newAccount);
        }
        updateContacts(accUpdateList);

    }
    public void updateContacts(List<Account> newAccountsforupdate){
        System.debug('contactId');
    }
}