public class ContactRest {
 public static void saveContacts()
    {
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://ap4.salesforce.com/services/data/v43.0');
                req.setMethod('GET');
        
     
       string body = '{ "username" : {!$Credential.Username}, "password" : {!$Credential.Pasword}}';
        System.debug(body);
        req.setBody(body);
        Http http = new Http();
        HttpResponse resp=http.send(req);
        System.debug(resp.getBody()+'endpoint'+req.getEndpoint()); 
    }
}