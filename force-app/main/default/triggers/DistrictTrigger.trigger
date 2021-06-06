trigger DistrictTrigger on Districts__c (before insert,before update) {


    Set<String> stateids=new Set<String>();
    for(Districts__c district :Trigger.new){
        stateids.add(district.state_id__c);}
    List<Location__c> states=[select id,stateid__c from Location__c where stateid__c in :stateids];
    Map<String,Location__c> stateIdMap= new Map<String,Location__c>();
    for(Location__c state:states){

        if(!stateIdMap.containsKey(state.stateid__c)){
            stateIdMap.put(state.stateid__c,state);
        }   
    }
    for(Districts__c district :Trigger.new){

        district.State__c=stateIdMap.get(district.state_id__c).Id;

    }
}