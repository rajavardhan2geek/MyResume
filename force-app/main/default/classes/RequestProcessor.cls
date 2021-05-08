public class RequestProcessor {

    private final static String REQUEST_BODY = 'grant_type=password&client_id={0}&client_secret={1}&username={2}&password={3}';
    AuthorizationHeader headerObj;
    Http httpserver;
    public RequestProcessor(){
         this.httpserver=new Http();
    }
    public RequestProcessor(AuthorizationHeader headerObj ){
        this.headerObj=headerObj;
        this.httpserver=new Http();
    }
    public void routeProcessor(){
      //  if(this.headerObj.method.equalsIgnoreCase('GET'))
       if(true)
        {
            this.sendGetRequest();
        }
        else if(this.headerObj.method.equalsIgnoreCase('POST')){
            this.sendPostrequest();
        }
        else if(this.headerObj.method.equalsIgnoreCase('DELETE')){
            this.sendDeleterequest();
        }
        else if(this.headerObj.method.equalsIgnoreCase('PUT')){
            this.sendPutrequest();
        }
        else{
            
        }
    }
    private void sendGetRequest(){
        HttpRequest req=new HttpRequest();
        req.setMethod('GET');
        req.setEndpoint('https://professionalresume-dev-ed.my.salesforce.com/services/data/v51.0/');
        
        req.setHeader('Authorization','Bearer 00D5g000004L8Us!ARkAQC3loZsWgqhs5XB6tPbUykNQ.mCa8kzCQzWBOBRNLP9tY3C9sq4Hpn5mpEU5U3bpr.NMGOgB6lIjaL8OplMKhKUn3qbX');
        HttpResponse response = this.httpserver.send(req);
        System.debug(response);
    }
    private void sendPostrequest(){
        HttpRequest req=new HttpRequest();
        req.setMethod(this.headerObj.method);
        req.setEndpoint(this.headerObj.endpoint);
        this.createAuthorizationHeader(req);
        HttpResponse response = this.httpserver.send(req);
        OAuthResponse objAuthenticationInfo = (OAuthResponse)JSON.deserialize(response.getbody(), OAuthResponse.class);
        System.debug(objAuthenticationInfo);
    }
    private void sendDeleterequest(){
        
    }
    private void sendPutrequest(){
        
    }
    private void createAuthorizationHeader(HttpRequest request){
        Blob headerValue = Blob.valueOf(headerObj.username + ':' + headerObj.password);
        String authorizationHeader = 'BASIC' +EncodingUtil.base64Encode(headerValue);
        request.setHeader('Authorization', authorizationHeader); 
        request.setBody(String.format(REQUEST_BODY ,new string[]{headerObj.consumerKey,headerObj.consumerSecret
                                                                  ,headerObj.username,headerObj.password}));
    }
}