public with sharing class AccountController {
    public AccountController() {

    }

    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountList(){

        return [select Id,Name,Phone,Industry from Account];
    }
}