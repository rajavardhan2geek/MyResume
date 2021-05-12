public with sharing class CovidOutboundEmail {

    private List<String> toAddresses;
    private List<String> ccAddresses;
    private List<Contact> contacts;
    private EmailTemplate customemailTemplate;
    public CovidOutboundEmail() {
			this.contacts= new List<Contact>();
    }

    public void getContacts(){

        this.toAddresses = new List<String>();
        this.ccAddresses =  new List<String>();
      //  List<Contact> contacts = [select Id ,Email from Contact where TeamMember__c=true];
        for(Contact contact:[select Id ,Email from Contact where TeamMember__c=true]){
            this.contacts.add(contact); 
           
        }

 
    }
    public void sendEmail(){
        Messaging.SingleEmailMessage[] mailList=new Messaging.SingleEmailMessage[]{} ;
        EmailServicesAddress emailaddr= [select Id,EmailDomainName from EmailServicesAddress where DeveloperName ='Covid_Response'];
        for(Contact contact: this.contacts){
            
            Messaging.SingleEmailMessage mail=new Messaging.SingleEmailMessage();
            mail.setSaveAsActivity(false);
            mail.setTargetObjectId(contact.Id);
            mail.setReplyTo('covidresponse@'+emailaddr.EmailDomainName);
            mail.setSenderDisplayName('Covid Support');
            mail.setUseSignature(false);
            mail.setTemplateId(this.customemailTemplate.Id);
            mailList.add(mail);
        }

        Messaging.sendEmail(mailList);
        }

    public void getEmailTemplate(String emailTemplateDevName){
        this.customemailTemplate =[select Id from EmailTemplate where DeveloperName =:emailTemplateDevName];
    }
}