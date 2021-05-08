public class CompanyBotExtension {

    public String  contactso{get;set;}
    public CompanyBotExtension(ApexPages.StandardController controller){
        
        
    }
    public PageReference saveText(){
      
        Contact varcontact=(Contact)JSON.deserialize(contactso, Contact.class);
        System.debug('contact'+varcontact);
        return null;
    }
}