public class RecordFormCustomUI {

    @AuraEnabled
    public static Map<String,String> getcampsites(String campsite)
    {
        Map<String,String> exampMap = new Map<String,String>();
        exampMap.put('key1','value1');
        exampMap.put('key2','value1');
        exampMap.put('key3','value1');
        List<Campsite__c> campsites= [select Id,Name,(select Name,Id,User__c From Campsite_Reservations__r) from Campsite__c where Id=:campsite	];
        return exampMap;
    }
}