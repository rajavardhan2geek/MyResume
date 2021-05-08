public class FormRequirements {

    public List<FormFields__c> questionlist{get;set;}
    public List<Form_Section__c> sectionlist{get;set;}
    public String section {get;set;}
    public static final String sectionn;
    public static final String form;
    public List<String> responses{get;set;}
    public String jsonresp{get;set;}
    String accesstoken;
    static {
        form='StudentsForm';
       sectionn ='Basic Information';
    }
    
  String code;
  public FormRequirements()
  {
       code = ApexPages.currentPage().getParameters().get('code') ;
      System.debug(code);
      if(code != '' && code != null)
      service(); 
        
  }
   public PageReference DropAuth()
   {
  //https://www.dropbox.com/oauth2/authorize?response_type=code&client_id=ktnscdogmnbju8f&redirect_uri=https://rajavardhan-cloud-dev-ed--c.ap5.visual.force.com/apex/AppFormPage
       PageReference pg = new PageReference('https://stackexchange.com/oauth/dialog?client_id=769&scope=no_expiry&redirect_uri=https://rajavardhan-cloud-dev-ed--c.ap5.visual.force.com/apex/AppFormPage') ;
       return pg ;
   }
   public  PageReference getSectionsandQuestions()
    {
        
        if(section!=null)
        sectionlist = [select Id from Form_Section__c where Name =:section];
        else
   		sectionlist = [select Id from Form_Section__c where Name =:sectionn];         
        for(Form_Section__c section:sectionlist)
        questionlist =[select FieldName__c,FieldType__c from FormFields__c where Form_Section__c=:section.id];
        System.debug(''+questionlist);
        
        return null;
    }
    public void service()
    {
        
        Http http= new Http();
        HttpRequest req= new HttpRequest();
        req.setEndpoint('https://api.dropbox.com/oauth2/token?grant_type=authorization_code&code='+code+'&redirect_uri=https://rajavardhan-cloud-dev-ed--c.ap5.visual.force.com/apex/AppFormPage');
        req.setMethod('POST');
        Blob headerValue = Blob.valueOf('ktnscdogmnbju8f' + ':' + 'm255df3sny7u43l');
        String authorizationHeader = 'BASIC ' + EncodingUtil.base64Encode(headerValue);
        req.setHeader('Authorization', authorizationHeader);
         HttpResponse resp= http.send(req);
        String jsonstring = resp.getBody();
        JSONParser parser = JSON.createParser(jsonstring);
        while(parser.nextToken()!=null)
        	{
             if ((parser.getCurrentToken() == JSONToken.FIELD_NAME)){
                String fieldName = parser.getText();
                parser.nextToken();
                if(fieldName == 'access_token') {
                    accesstoken = parser.getText();
                } 
             }
            }
        jsonresp=jsonstring;
        System.debug('jsonresp'+jsonresp);
        System.debug('access token '+accesstoken);
        string token = 'https://api.dropbox.com/2/users/get_account ';
        HttpRequest req1 = new HttpRequest();
        req.setEndpoint(token);
        req.setHeader('Authorization','Bearer ' +accesstoken);
        req.setHeader('Content-Type', 'application/json');
        req.setBody('{\'account_id\': \'dbid:AAH4f99T0taONIb-OurWxbNQ6ywGRopQngc\'}');
        req.setMethod('POST');
        req.setTimeout(60000);
        Http h1 = new Http();
        HttpResponse res1 = h1.send(req);
        string resp1 = res1.getBody();
        System.debug(resp1);
		JSONParser parser1 = JSON.createParser(resp1);
        while(parser1.nextToken()!=null)
        {
             if ((parser1.getCurrentToken() == JSONToken.FIELD_NAME)){
                String fieldName = parser1.getText();
                 responses.add(fieldName);
                parser1.nextToken();

                } 
             }
        
            
        System.debug(' Account Information :: ' + resp1+''+res1.getStatus());
    }
}