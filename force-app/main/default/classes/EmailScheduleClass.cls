public class EmailScheduleClass  implements Schedulable{

      
    public void execute(System.SchedulableContext sc)
    {
      //   sendRequestWeatherApi();
        EmailTemplate emailtemplate = [select Id,Name FROM EmailTemplate where Id='00X7F000000Effj'];
        Messaging.SingleEmailMessage mail = new  Messaging.SingleEmailMessage();
        mail.setTemplateId(emailtemplate.Id);
        List<String> toaddresses = new List<String>();
        toaddresses.add('rajavardhan1290@gmail.com');
       
        mail.setToAddresses( toaddresses);
      
        
        mail.setWhatId('0017F00001hVnRw');
        mail.setSubject('Daily Weather Updates');
        mail.setTreatBodiesAsTemplate(true);
              
            mail.setSaveAsActivity(false);
      
           
        List<Messaging.Email> mails = new List<Messaging.Email>();
        mails.add(mail);
        Messaging.sendEmail(mails);
       
    }
}