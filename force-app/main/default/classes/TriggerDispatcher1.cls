public class TriggerDispatcher1 {
    
    private static Set<String> bypassedHandlers;
    /**
     * Params:Instance of Interface ITriggerHandler1
     * Overload method for various SObject Trigger Handlers to segregate into respective Trigger Events
     * */
    public static void run(ITriggerHandler1 handler){

        String triggerName= getSObjectName();
        Map<String,Trigger_Setting__mdt> triggerSettingMap =  initTriggerSettingMap(triggerName);
        TriggerParameters triggerParameters=new TriggerParameters();
        if((triggerSettingMap.size()==0 )|| (triggerSettingMap.size()>0 && !triggerSettingMap.get(triggerName).isDisabled__c)){
            
            switch on Trigger.operationType{
                
                when BEFORE_INSERT {
                    //Before Insert
                    
                    if(triggerSettingMap.get(triggerName).beforeInsert__c){
                        handler.beforeInsert(triggerParameters);
                    }
                }
                when AFTER_INSERT {
                    //After Insert
                    if(triggerSettingMap.get(triggerName).afterInsert__c){
                        handler.afterInsert(triggerParameters);
                    }
                }
                when BEFORE_UPDATE {
                    //before update
                    if(triggerSettingMap.get(triggerName).beforeUpdate__c){
                        handler.beforeUpdate(triggerParameters);
                    }
                }
                when AFTER_UPDATE {
                    //after update
                    if(triggerSettingMap.get(triggerName).afterUpdate__c){
                        handler.afterUpdate(triggerParameters);
                        
                    }
                }
                when BEFORE_DELETE {
                    //before delete
                    if(triggerSettingMap.get(triggerName).beforeDelete__c){
                        handler.beforeDelete(triggerParameters);
                        
                    }
                    
                }
                when AFTER_DELETE {
                    //after delete
                    if(triggerSettingMap.get(triggerName).afterDelete__c){
                        handler.afterDelete(triggerParameters);
                        
                    }
                }
                
                when AFTER_UNDELETE {
                    //after undelete
                    if(triggerSettingMap.get(triggerName).afterUndelete__c ){
                        handler.afterUnDelete(triggerParameters);
                    }
                }
            }
        } 
        
    }
    /**
     * Prepares Trigger Setting Map  from Custom Metadata
     * */
    public static Map<String,Trigger_Setting__mdt> initTriggerSettingMap(String sObjectApi){
      
        
        
        String soqlquery='select '+System.Label.TFMetadataFields+' from '+System.Label.TFMetadataConfig;
        List<Trigger_Setting__mdt>  triggerSettingRecords=Database.query(soqlquery);
        Map<String,Trigger_Setting__mdt> triggerSettingMap = new Map<String,Trigger_Setting__mdt>();
        for(Trigger_Setting__mdt triggerSetting :triggerSettingRecords ){
            
            triggerSettingMap.put(triggerSetting.SObject_Api_Name__c,triggerSetting);
            
        }
        return triggerSettingMap;
    }
    /**
     * Gets ObjectName from Trigger.new Object Type
     * */
    public static String getSObjectName(){
        SObjectType triggerObjType;
        if(Trigger.isDelete || Trigger.isUndelete){
            triggerObjType  = trigger.old.getSObjectType();
        }
        else
        triggerObjType  = trigger.new.getSObjectType();
        return triggerObjType.getDescribe().getName() ;
    }
    public Boolean isDisabled(){
        
        
        byPassProfiles__c profileCstmSetting = byPassProfiles__c.getInstance(UserInfo.getUserId());
        return profileCstmSetting.byPassTrigger__c;
    }
     
}