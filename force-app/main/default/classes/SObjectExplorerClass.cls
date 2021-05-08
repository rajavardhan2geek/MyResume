public inherited sharing class SObjectExplorerClass {
    public SObjectExplorerClass() {

    }
    @AuraEnabled(Cacheable=true)
    public static List<String> getSObjects(){
       
        Map<String, Schema.SObjectType> sobjectMap = Schema.getGlobalDescribe();
        List<String> sobjectList = new List<String>();
        sobjectList.addall(sobjectMap.keySet());
        return sobjectList;
    }
}