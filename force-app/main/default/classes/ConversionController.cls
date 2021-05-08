public without sharing class ConversionController {

    @AuraEnabled(cacheable=true)
    public List<pickListValues> getMeasuredType(){

        List<Unit_System_Record__mdt> unitsystemDims =[select Id ,Measured_Type__c, MasterLabel   from Unit_System_Record__mdt];
        for(Unit_System_Record__mdt usDims:unitsystemDims){

        }
        return null;
    }
    public class pickListValues{
        @AuraEnabled
        public String label{get;set;}
        @AuraEnabled
        public String value{get;set;}
    }
}