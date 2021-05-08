public with sharing class ExpenseController {


    @AuraEnabled(cacheable=true)
    public static DTable getDailyExpenses(String month){
       
        DTable dtable = new DTable();
        List<DTColumns> dtcols= new List<DTColumns>();
        dtable.dtcols = new List<DTColumns>();
        for(Data_table_Columns__c dtcol:[select fieldName__c,  editable__c, label__c,type__c  from Data_table_Columns__c order by fieldName__c desc]){

            DTColumns dtc2=new DTColumns();
            dtc2.label=dtcol.label__c;
            dtc2.fieldName=dtcol.fieldName__c;
            dtc2.editable=dtcol.editable__c;
            dtc2.type=dtcol.type__c;
            dtable.dtcols.add(dtc2);
        }
 
        
        dtable.dailyExpenses=[select Id,Bill_Amount__c,Month__c,Bill_Date__c,Current_Month__c,Name,Current_Month__r.Month__c,Expense_Type__c from Daily_Expenses__c];
        return dtable;
    }

    @AuraEnabled(cacheable=true)
    public static List<Row_Actions__c> getRowActions(){
        return [select Name,label__c from Row_Actions__c order by Name  desc];
    }
    public class DTable{

        @AuraEnabled
        public List<Daily_Expenses__c> dailyExpenses;
        @AuraEnabled
        public List<DTColumns> dtcols;
    }
    public class DTResponseData{

    }
    public Class DTColumns{
    

        @AuraEnabled
        public String label;
        @AuraEnabled
        public String fieldName;
        @AuraEnabled
        public Boolean editable;
        @AuraEnabled
        public String type; 
       
     }
}