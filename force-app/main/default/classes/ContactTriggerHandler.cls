/**
 * @author [author]
 * @email [example@mail.com]
 * @create date 2020-09-07 22:47:24
 * @modify date 2020-09-07 22:47:24
 * @desc [description]
 */


public with sharing class ContactTriggerHandler implements ITriggerHandler {

    Set<String> byPassedHandlers = new Set<String>();

    public ContactTriggerHandler(){
      
    }
    /**
      * @description
      * @param newList
      * @example
      */
    public void beforeInsert(List<sObject> newList){


        System.debug('before Insert');
        if(isDisabled()){
            System.debug('disabled before insert contact business logic trigger handler');
            return ;
        }
        if(disableHandlerinEvntofBatch('AccountBeforeInsertHelper')){
            System.debug('disabled before insert contact for Batch Class');
            return ;
        }
    }
    public void afterInsert(List<sObject> newList, Map<Id, sObject> newMap){
        System.debug('AFTER Insert');
        if(!disableHandlerinEvntofBatch('ContactAfterInsertHandler') || !isDisabled()){
            System.debug('disabled before  contact insert for Batch Class');
            new ContactAfterInsertHandler().mainEntry(newList);
        }
    }
    public void beforeUpdate(List<sObject> newList, Map<Id, sObject> newMap,  List<sObject> oldList, Map<Id, sObject> oldMap){
        System.debug('before UPDATE');
    }
    public void afterUpdate(List<sObject> newList, Map<Id, sObject> newMap,  List<sObject> oldList, Map<Id, sObject> oldMap){
        System.debug('AFTER UPDATE');
    }   

    public void beforeDelete(List<sObject> oldList , Map<Id, sObject> oldMap){
        System.debug('before delete');
    }
    public void afterDelete(List<sObject> oldList , Map<Id, sObject> oldMap){
        System.debug('AFTER delete');
    }

    public void afterUnDelete(List<sObject> newList, Map<Id, sObject> newMap){
        System.debug('AFTER UNDELETE');
    }
    /**
     * 
     * @return   return description
     * */
    public Boolean isDisabled(){
        Set<Id> userIdSet = new Set<Id>();
        Set<String> profileIdSet = new Set<String>();
        String sObjectApi='Contact';
        List<Trigger_Setting__mdt>  triggerSettingRecords=[select Id,SObject_Api_Name__c,MasterLabel ,(select MasterLabel,UserId__c,Profile__c from Trigger_By_Pass_Settings__r),isDisabled__c,afterInsert__c,afterUpdate__c,beforeInsert__c,beforeUpdate__c,afterDelete__c,beforeDelete__c,afterUndelete__c from Trigger_Setting__mdt where SObject_Api_Name__c =:sObjectApi];
        for(Trigger_Setting__mdt triggerSetting :triggerSettingRecords){
            
            if(triggerSetting.Trigger_By_Pass_Settings__r.size() > 0){
                for(Trigger_By_Pass_Setting__mdt triggerBypassUserRec:triggerSetting.Trigger_By_Pass_Settings__r){
                    userIdSet.add(triggerBypassUserRec.UserId__c);
                    profileIdSet.add(triggerBypassUserRec.Profile__c);}
            }
        }
        
        if(userIdSet.size()>0){
            if(userIdSet.contains(UserInfo.getUserId()))
                return true;
        }
        
            return false;
    }
   
    /**
     * Checks for Batch to stop executing Some Trigger Helper
     * @returns 
     * 
     */
    public Boolean disableHandlerinEvntofBatch(String evntClsName){
        if(System.isBatch()){
           if(byPassedHandlers.contains(evntClsName)){
               return true;}
           }
           return false;
    }
}