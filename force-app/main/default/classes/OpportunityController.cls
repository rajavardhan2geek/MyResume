public without sharing class OpportunityController {

@AuraEnabled(cacheable=true)
public static List<Opportunity> getOpportunities(){

    System.debug('sds');

 return [select Id,Name,Account.Name,StageName,(select Id,Name,Product2Id,Quantity from OpportunityLineItems) from Opportunity];
}

@AuraEnabled(cacheable=true)
public static List<OrderItem> getOrderItems(String orderId){
    String order = String.escapeSingleQuotes(orderId);
    return [select Id,OrderItemNumber,Product__c from OrderItem where OrderId =:order];
}

}