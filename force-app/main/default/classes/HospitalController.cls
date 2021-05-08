public with sharing class HospitalController {

    @AuraEnabled
    public static List<Hospital__c> getallHospital()
    {
        
		      
        return  [select HospitalName__c,Category__c ,City__r.Name,City__r.Phone__c,City__r.Address__c from Hospital__c];
        
    }
    @AuraEnabled
    public static List<Hospital__c> getSuperHosp(String category)
    {
         return  [select HospitalName__c,Category__c ,City__r.Name,City__r.Phone__c,City__r.Address__c from Hospital__c where Category__c =:category];
    }
  
}