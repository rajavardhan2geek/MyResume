global class CovidResponseEmail implements Messaging.InboundEmailHandler {
    
    global Messaging.InboundEmailResult handleInboundEmail(Messaging.inboundEmail email,Messaging.InboundEnvelope env){
                    
      Messaging.InboundEmailResult covidresponseemail = new Messaging.InboundEmailResult();
      String subject= email.subject;
      String body =email.plainTextBody;
      String htmlbody =email.htmlBody;
      String fromAddress = email.fromAddress;
      try {
        Contact tmcontact=[select Id from Contact where Email =:String.escapeSingleQuotes(fromAddress)];
          Covid_Test__c covidTest=new Covid_Test__c();
          covidTest.Contact__c=tmcontact.Id;
       List<String> trrows=HTMLParser.scan(htmlbody);
       System.debug('trrows '+trrows);
       for(String trrow:trrows){
        System.debug('trrows row '+trrow);
        if(trrow.contains('Employee Id') ){
          covidTest.Employee_Id__c=this.matchEmpId(trrow);}
           else if(trrow.contains('Last Visit to Office')){
             covidTest.Last_Visit_to_Office__c=this.matchDate(trrow);}
           else if(trrow.contains('Date of COVID Test')){
             covidTest.Covid_Tested_Date__c=this.matchDate(trrow);}
           else if(trrow.contains('Date Covid Positive Test Result')){
             covidTest.Covid_Positive_Date__c=this.matchDate(trrow);}
            else if(trrow.contains('Date when case was reported')){
            covidTest.Case_Reported_Date__c=this.matchDate(trrow);}
             else if(trrow.contains('Current Address of Employee')){
                   covidTest.Current_Address__c=trrow.substringAfter('Current Address of Employee ');     
                    }
       }
        
			 
     //   List<String> rowList = body.split('\n\n');
     
          
       /*  
       for(String line:rowList){
          
            System.debug('line'+line);
            
            
             covidTest.Contact__c=tmcontact.Id;
             
            if(line.contains('Employee Id') ){
            covidTest.Employee_Id__c=this.matchEmpId(line);}
             else if(line.contains('Last Visit to Office')){
               covidTest.Last_Visit_to_Office__c=this.matchDate(line);}
             else if(line.contains('Date of COVID Test')){
               covidTest.Covid_Tested_Date__c=this.matchDate(line);}
             else if(line.contains('Date Covid Positive Test Result')){
               covidTest.Covid_Positive_Date__c=this.matchDate(line);}
              else if(line.contains('Date when case was reported')){
              covidTest.Case_Reported_Date__c=this.matchDate(line);}
               else if(line.contains('Current Address of Employee')){
                     covidTest.Current_Address__c=line.substringAfter('Current Address of Employee ');     
                      }
                   
              
          
        }*/
        System.debug(covidTest);
         Database.upsert(covidTest);
        covidresponseemail.success=true;
        covidresponseemail.message='Created Covid Response for Contact';
        return null;

    }
    catch (Exception e) {
        System.debug('Incorrect Format Email Exception' + e);
        return null;        
    }

  }
    private String matchEmpId(String line){
       // System.debug('match line'+line);
        Pattern datePattern = Pattern.compile('(\\d+{7})');
        Matcher dateMatcher = datePattern.matcher(line);
        
        if (dateMatcher.find()) {
        System.debug('matcher group'+dateMatcher.group(1));
        return dateMatcher.group(1);
        }
        else{
            return null;
        }
    }
    private Date matchDate(String line){
        Pattern datePattern = Pattern.compile('([0-9]{0,2}/[0-9]{0,2}/[0-9]{4})');
        Matcher dateMatcher = datePattern.matcher(line);
         if(dateMatcher.find()){
         System.debug('matcher group'+dateMatcher.group(1));
        return Date.parse(dateMatcher.group(1));
         }
        else{
            return null;
        }
    }
    private String replaceBreaks(String htmlline){
         Pattern datePattern = Pattern.compile('<br/>');
        Matcher dateMatcher = datePattern.matcher(htmlline);
        return null;
    }
}