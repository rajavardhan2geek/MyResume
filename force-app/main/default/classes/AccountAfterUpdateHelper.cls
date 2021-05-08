public with sharing class AccountAfterUpdateHelper {

    public static Boolean stopRecursion =false;
    public void mainEntry(Map<Id,Account> newAccMap,Map<Id,Account> oldAccMap){

        List<Account> accountList = new List<Account>();
        for(Account newAccount:newAccMap.values()){

            Account oldAccount = oldAccMap.get(newAccount.Id);
            if(newAccount.NumberOfEmployees != oldAccount.NumberOfEmployees && newAccount.NumberOfEmployees>0){
            accountList.add(newAccount);}
        }
 
        if(accountList.size()>0){
          insertContact(accountList);
        }
    }
    public void insertContact( List<Account> accountList){
        System.debug(' executing twice from  contact trigger ');
        List<Contact> newEmpList= new List<Contact>();
        for(Account acc :accountList ){
            newEmpList.add(new Contact(LastName=acc.Name ,AccountId=acc.Id) );
        }
        if(newEmpList.size()>0 && !stopRecursion){
            stopRecursion=true;
            insert  newEmpList;
           
        }

    }

    
}