public with sharing class ContactController {


    @AuraEnabled(cacheable=true)
    public  static List<Contact> getContacts(){
       
        try{
            //  List<Contact>  contacts= [select FirstName,LastName,Email from Contact];
            throw new AuraHandledException('Forced error');

          //  return contacts;
        }
        catch(AuraHandledException e){
         return null;
        }
     
    }


    public class AuraHandledException Extends Exception{

    }
}