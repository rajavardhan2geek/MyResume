public with sharing class SearchObjectController {


@AuraEnabled(cacheable=true)
public static List<ObjectApiName> getSObjectList(){

    Map<String,Schema.SObjectType> sobjectMap = Schema.getGlobalDescribe();
    List<ObjectApiName> objects = new List<ObjectApiName>();
    for(Schema.SObjectType objecttype :sobjectMap.values())
    {
         objects.add(new ObjectApiName(objecttype.getDescribe().getLabel(),objecttype.getDescribe().getName()));

    }
    return objects;

}

@AuraEnabled(cacheable=true)
public static List<ObjectApiName> getAllFields(String objectName){

   Map<String,Schema.SObjectType> sobjectMap = Schema.getGlobalDescribe();
    Map<String,Schema.SObjectField> fieldMap =sobjectMap.get(objectName).getDescribe().fields.getMap();
    System.debug(fieldMap);
    
      List<ObjectApiName> fieldapinames = new List<ObjectApiName>();
    for(Schema.SObjectField objfield:fieldMap.values()){
         fieldapinames.add( new ObjectApiName(objfield.getDescribe().getLabel(),objfield.getDescribe().getName()));
        }
    return fieldapinames;

}

public class ObjectApiName{

   @AuraEnabled
   public String value;
   @AuraEnabled
   public String label;
   public ObjectApiName(String label,String value){
       this.value =value;
       this.label=label;
   }
}
}