public with sharing class AccountLWCController {

public AccountLWCController()
{
    
}
@AuraEnabled(cacheable=true)
public static List<Account> getAllaccounts(){

    System.debug('hello');
    return [select Id,Name,AccountNumber  From Account];
    
}


@AuraEnabled(cacheable=true)
public static List<Contact> getContacts(Integer numberRows,Integer skipRows){

System.debug('numberRows '+skipRows);
    return [select Id,Name  From Contact ORDER BY NAME ASC ];
    
}


@AuraEnabled(cacheable=true)
public static Integer getContactsRows(){
    return [select count() from Contact];
    
}

}