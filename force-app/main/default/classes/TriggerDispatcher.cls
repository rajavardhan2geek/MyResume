public class TriggerDispatcher {
    public static void run(ITriggerHandler handler){
        
        
        
        //Check if the trigger is disabled
        /*if (handler.IsDisabled()){
return;
}*/
        String triggerName= getSObjectName();
        Map<String,Trigger_Setting__mdt> triggerSettingMap =  initTriggerSettingMap(triggerName);
        //Get the trigger active information from custom settings by trigger name
        //  Boolean isActive = true;//TriggerSetting__c.getValues(triggerName).isActive__c;
        /*  if(!triggerSettingMap.isEmpty() && triggerSettingMap.get(triggerName).isDisabled__c){ 

return;
}*/
        TriggerParameters triggerParameters=new TriggerParameters();
        if(triggerSettingMap.size()>0 && !triggerSettingMap.get(triggerName).isDisabled__c){
            
            switch on Trigger.operationType{
                
                when BEFORE_INSERT {
                    //create related records
                    
                    if(triggerSettingMap.get(triggerName).beforeInsert__c &&  !(disableBatch()) ){
                        handler.beforeInsert(trigger.new);
                    }
                }
                when AFTER_INSERT {
                    //create related records
                    if(triggerSettingMap.get(triggerName).afterInsert__c  &&  !(disableBatch()) ){
                        handler.afterInsert(trigger.new, trigger.newMap);
                    }
                }
                when BEFORE_UPDATE {
                    //create related records
                    if(triggerSettingMap.get(triggerName).beforeUpdate__c  &&  !(disableBatch())  ){
                        handler.beforeUpdate(trigger.new, trigger.newMap, trigger.old, trigger.oldMap);
                    }
                }
                when AFTER_UPDATE {
                    //create related records
                    if(triggerSettingMap.get(triggerName).afterUpdate__c  &&  !(disableBatch())  ){
                        handler.afterUpdate(trigger.new, trigger.newMap, trigger.old, trigger.oldMap);
                        
                    }
                }
                when BEFORE_DELETE {
                    //create related records
                    if(triggerSettingMap.get(triggerName).beforeDelete__c  &&  !(disableBatch())  ){
                        handler.beforeDelete(trigger.old, trigger.oldMap);
                        
                    }
                    
                }
                when AFTER_DELETE {
                    //create related records
                    if(triggerSettingMap.get(triggerName).afterDelete__c  &&  !(disableBatch())  ){
                        handler.afterDelete(trigger.old, trigger.oldMap);
                        
                    }
                }
                
                when AFTER_UNDELETE {
                    //do nothing for AFTER_UNDELETE, BEFORE_DELETE, or BEFORE_UPDATE
                    if(triggerSettingMap.get(triggerName).afterUndelete__c  &&  !(disableBatch())  ){
                        handler.afterUnDelete(trigger.new, trigger.newMap);
                    }
                }
            }
        } 
        
    }
    
    public static Map<String,Trigger_Setting__mdt> initTriggerSettingMap(String sObjectApi){
        List<Trigger_Setting__mdt>  triggerSettingRecords=[select Id,SObject_Api_Name__c,MasterLabel ,(select MasterLabel,UserId__c,Profile__c from Trigger_By_Pass_Settings__r),isDisabled__c,afterInsert__c,afterUpdate__c,beforeInsert__c,beforeUpdate__c,afterDelete__c,beforeDelete__c,afterUndelete__c from Trigger_Setting__mdt where SObject_Api_Name__c =:sObjectApi];
        Map<String,Trigger_Setting__mdt> triggerSettingMap = new Map<String,Trigger_Setting__mdt>();
        for(Trigger_Setting__mdt triggerSetting :triggerSettingRecords ){
            
            triggerSettingMap.put(triggerSetting.SObject_Api_Name__c,triggerSetting);
            
        }
        return triggerSettingMap;
    }
    
    public static boolean disableBatch(){
   
        String sObjectname=getSObjectName();
        List<Batch_Controls__mdt> batchControlList =[select MasterLabel,SObjectType__c,DeveloperName,After_Delete__c,After_Insert__c,After_Update__c,Before_Delete__c,Before_Insert__c, Before_Update__c,Business_Classes__c  from Batch_Controls__mdt where SObjectType__c=:sObjectname];
        if(batchControlList.size()>0){
            
            
            boolean disabledflg=(batchControlList.get(0).Before_Insert__c || batchControlList.get(0).Before_Update__c || batchControlList.get(0).After_Update__c || batchControlList.get(0).After_Insert__c || batchControlList.get(0).After_Delete__c );
            System.debug('disable batch class'+disabledflg);
            return (System.isBatch() &&  disabledflg);
        }
        else 
        {  return false;}
    }
    
    public static String getSObjectName(){
        SObjectType triggerObjType;
        if(Trigger.isDelete || Trigger.isUndelete){
            triggerObjType  = trigger.old.getSObjectType();
        }
        triggerObjType  = trigger.new.getSObjectType();
        return triggerObjType.getDescribe().getName() ;
    }
}