/**
 * @author Rajavardhan
 * @email [example@mail.com]
 * @create date 2020-09-07 22:47:48
 * @modify date 2020-09-07 22:47:48
 * @desc [description]
 */
public without sharing class AccountTriggerHandler  implements  ITriggerHandler{

    Set<String> byPassedHandlers = new Set<String>();

    public AccountTriggerHandler(){
      
    }
    public void beforeInsert(List<sObject> newList){

        if(!isDisabled()){
           System.debug('before Insert');
        
        }
    }
    public void afterInsert(List<sObject> newList, Map<Id, sObject> newMap){
    	 if(!isDisabled()){
        System.debug('AFTER Insert');
        }
    }
    public void beforeUpdate(List<sObject> newList, Map<Id, sObject> newMap,  List<sObject> oldList, Map<Id, sObject> oldMap){
       
        if(!isDisabled()){
         
			 System.debug('before UPDATE');           
        }
    }
    public void afterUpdate(List<sObject> newList, Map<Id, sObject> newMap,  List<sObject> oldList, Map<Id, sObject> oldMap){
        if(!isDisabled()){
            
            System.debug('AFTER UPDATE');
            Map<Id,Account> newAccMap= (Map<Id,Account>) newMap;
            Map<Id,Account> oldAccMap= (Map<Id,Account>) oldMap;
            new AccountAfterUpdateHelper().mainEntry(newAccMap,oldAccMap);
        }
        
    
    }   

    public void beforeDelete(List<sObject> oldList , Map<Id, sObject> oldMap){
         if(!isDisabled()){
       			 System.debug('before delete');
         }
    }
    public void afterDelete(List<sObject> oldList , Map<Id, sObject> oldMap){
        if(!isDisabled()){
            System.debug('AFTER delete');
        }
    }

    public void afterUnDelete(List<sObject> newList, Map<Id, sObject> newMap){
        if(!isDisabled()){
            System.debug('AFTER delete');
        }
    }
    public Boolean isDisabled(){
     
        
        byPassProfiles__c profileCstmSetting = byPassProfiles__c.getInstance(UserInfo.getUserId());
        return profileCstmSetting.byPassTrigger__c;
    }
  
    }