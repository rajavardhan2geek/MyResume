/**
 * @author [author]
 * @email [example@mail.com]
 * @create date 2020-09-07 22:47:24
 * @modify date 2020-09-07 22:47:24
 * @desc [description]
 */


public with sharing class ContactTriggerHandler1 implements ITriggerHandler1 {

   

    public ContactTriggerHandler1(){
      
    }
    /**
      * @description
      * @param newList
      * @example
      */
    public void beforeInsert(TriggerParameters tp){

        if(!isDisabled()){
             System.debug('contact before Insert');
      //      new ContactBeforeInsertHandler().validateContacts(tp.newList);
             new ContactBeforeInsertHandler().prePopulateContacts(tp.newList);
        }
   
    }
    public void afterInsert(TriggerParameters tp){
       
        if(!isDisabled()){
             System.debug('contact AFTER Insert');
         //   new ContactAfterInsertHandler().mainEntry(tp.newList);
        }
    }
    public void beforeUpdate(TriggerParameters tp){
        if(!isDisabled()){
        System.debug('before UPDATE');
        }
    }
    public void afterUpdate(TriggerParameters tp){
         if(!isDisabled()){
        System.debug('AFTER UPDATE');
         }
    }   

    public void beforeDelete(TriggerParameters tp){
        if(!isDisabled()){
            System.debug('before delete');
        }
    }
    public void afterDelete(TriggerParameters tp){
        if(!isDisabled()){
            System.debug('AFTER delete');
        }
    }

    public void afterUnDelete(TriggerParameters tp){
        if(!isDisabled()){
            System.debug('AFTER UNDELETE');
        }
    }
    /**
     * 
     * @return   return description
     * */

    public Boolean isDisabled(){
        
        
        byPassProfiles__c profileCstmSetting = byPassProfiles__c.getInstance(UserInfo.getUserId());
        return profileCstmSetting.byPassTrigger__c;
    }   

}