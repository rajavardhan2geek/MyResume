public  class SObjectModel {

    public SObjectType  objType{get;set;}
    public String objectapiname{get;set;}
    public List<SObjectField> fieldList{get;set;}
    public List<SObjectField> selectFieldList{get;set;}

    public SObjectModel(String objName){
        this.objType= Schema.getGlobalDescribe().get(objName);
    }

    public List<String> getChildRelationships(){
        List<String> childRelList = new List<String>();
        List<Schema.ChildRelationship> childRelNames = this.objType.getDescribe().getChildRelationships();
        System.debug(this.objType.getDescribe().getChildRelationships());
        for(Schema.ChildRelationship childRel:childRelNames){
                childRelList.add(childRel.getRelationshipName());
        }
        return childRelList;
    }
    public  List<String> getFieldNames(){
        List<String> fieldNames=new List<String>();
        Map<String,SObjectField> fieldMap = this.objType.getDescribe().fields.getMap();
        for(String field:fieldMap.keySet()){
             fieldNames.add(field);

        }
        return fieldNames;
    }
    public List<String> getGroupFieldNames(){
        Map<String,List<String>> grpaggMap= new Map<String,List<String>>();
        List<String> groupFieldNameList=new List<String>();
        List<String> aggregateFieldNameList=new List<String>();
        Map<String,SObjectField> fieldMap = this.objType.getDescribe().fields.getMap();
        for(SObjectField field:fieldMap.values()){
             if(field.getDescribe().isGroupable()){
                      groupFieldNameList.add(field.getDescribe().getName());
                      grpaggMap.put('groupby',groupFieldNameList);
                    }
             if(field.getDescribe().isAggregatable()){
                    aggregateFieldNameList.add(field.getDescribe().getName());
                    grpaggMap.put('aggregateby',aggregateFieldNameList);
                }

        }
        return groupFieldNameList;
    }
}