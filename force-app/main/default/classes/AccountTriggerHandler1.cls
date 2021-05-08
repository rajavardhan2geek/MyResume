/**
 * Account Trigger Handler class for Events
 **/
public without sharing class AccountTriggerHandler1  implements  ITriggerHandler1{

    Set<String> byPassedHandlers = new Set<String>();

    public AccountTriggerHandler1(){
      
    }
    public void beforeInsert(TriggerParameters trigParameters){

        if(!isDisabled()){
           System.debug('before Insert');
        	new AccountBeforeInsertHandler().prePopulateAccount(trigParameters.newList);
        }
        
    }
    public void afterInsert(TriggerParameters trigParameters){
    	 if(!isDisabled()){
        System.debug('AFTER Insert');
        }
    }
    public void beforeUpdate(TriggerParameters trigParameters){
       
        if(!isDisabled()){
         
			 System.debug('before UPDATE');  
           Map<Id,Account> newAccMap= (Map<Id,Account>) trigParameters.newMap;
            Map<Id,Account> oldAccMap= (Map<Id,Account>) trigParameters.oldMap;
            new AccountBeforeLogicHandler().prePopulateAccountBeforeUpdate(newAccMap,oldAccMap);
        }
    }
    public void afterUpdate(TriggerParameters trigParameters){
        if(!isDisabled()){
            
            System.debug('AFTER UPDATE');
            Map<Id,Account> newAccMap= (Map<Id,Account>) trigParameters.newMap;
            Map<Id,Account> oldAccMap= (Map<Id,Account>) trigParameters.oldMap;
            new AccountAfterUpdateHelper().mainEntry(newAccMap,oldAccMap);
        }
        
    
    }   

    public void beforeDelete(TriggerParameters trigParameters){
         if(!isDisabled()){
       			 System.debug('before delete');
         }
    }
    public void afterDelete(TriggerParameters trigParameters){
        if(!isDisabled()){
            System.debug('AFTER delete');
        }
    }

    public void afterUnDelete(TriggerParameters trigParameters){
        if(!isDisabled()){
            System.debug('AFTER delete');
        }
    }
    public Boolean isDisabled(){
        
        
        byPassProfiles__c profileCstmSetting = byPassProfiles__c.getInstance(UserInfo.getUserId());
        return profileCstmSetting.byPassTrigger__c;
    }
  
    }