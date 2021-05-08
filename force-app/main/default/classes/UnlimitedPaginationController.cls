public with sharing class UnlimitedPaginationController {
    public UnlimitedPaginationController() {

    }
    @AuraEnabled(Cacheable=true)
    public static List<Contact> getContacts(Integer prevAccRef,Integer nextAccRef,Integer recordLimit){

        List<Contact>  contacts = new List<Contact>();
        if(prevAccRef == NULL && nextAccRef == NULL){
            contacts=[select Id,Name,Email,CreatedDate,Account.Name,OwnerId from Contact ORDER BY CreatedDate DESC LIMIT :recordLimit];
        }
        else if(prevAccRef==NULL && nextAccRef != NULL){
            contacts=[select Id,Name,Email,CreatedDate,Account.Name,OwnerId from Contact ORDER BY CreatedDate DESC LIMIT :recordLimit OFFSET :nextAccRef];
        }
        else if(prevAccRef!=NULL && nextAccRef == NULL){
            contacts=[select Id,Name,Email,CreatedDate,Account.Name,OwnerId from Contact ORDER BY CreatedDate DESC LIMIT :recordLimit OFFSET :prevAccRef];
        }
        if(!contacts.isEmpty()){
            return contacts;
        }
        return null;

    }


}