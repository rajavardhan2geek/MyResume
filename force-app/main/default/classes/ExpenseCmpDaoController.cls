public with sharing class ExpenseCmpDaoController {
    public ExpenseCmpDaoController() {

    }

    @AuraEnabled
    public static Daily_Expenses__c getExpenses(Id recordId){
        try {

            Daily_Expenses__c de=[select Current_Month__c,Id,Bill_Amount__c,Month__c from Daily_Expenses__c where id =: recordId];
            return de;
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}
