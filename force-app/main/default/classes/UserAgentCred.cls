public  class UserAgentCred {
    
    public String endpoint{get;set;}
    public String consumerKey{get;set;}
    public String consumersecret{get;set;}
    public String grantType;
    public String authorizationHeader{get;set;}
    public String redirectURI{get;set;}
    public String getAuthorizationMethod(String authMethod){
        
        if(authMethod =='WebServer'){
            this.endpoint='https://login.salesforce.com/services/oauth2/authorize';
            this.grantType=this.endpoint+'?response_type=code'+'&client_id='+this.consumerKey+'&redirect_uri='+this.redirectURI; 
            return this.grantType;
        }
         
        else if(authMethod =='UserAgent'){
            this.endpoint='https://login.salesforce.com/services/oauth2/authorize';
            this.grantType='?response_type=token&client_id='+this.consumerKey+'&redirect_uri'+this.redirectURI+'&state=';
            return this.grantType;
        }
        else if(authMethod =='JWT'){
            this.grantType='grant_type='+EncodingUtil.urlEncode('urn:ietf:params:oauth:grant-type:jwt-bearer','UTF-8')+'&assertion=';
            return this.grantType;
        }
        else {
            this.authorizationHeader='Basic '+EncodingUtil.base64Encode(Blob.valueOf(this.consumerKey+':'+this.consumersecret));
            this.grantType='grant_type=client_credentials';
            return this.grantType;
        }
    }
    public String getwebserverAuthorizationUrl(String authorizeCode){

        this.endpoint='https://login.salesforce.com/services/oauth2/token';
        this.grantType='grant_type=authorization_code&code='+authorizeCode+'&client_id='+this.consumerKey+'&client_secret='+this.consumersecret+'&redirect_uri='+this.redirectURI;
        return this.grantType;
    }
}