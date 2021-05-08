public class AuthorizationHeader{
        
        @AuraEnabled
        public String endpoint{get;set;}
        @AuraEnabled
        public String method{get;set;}
        @AuraEnabled
        public String username{get;set;}
        @AuraEnabled
        public String password{get;set;}
        @AuraEnabled 
        public String consumerKey{get;set;}
        @AuraEnabled
        public String consumerSecret{get;set;}
      public AuthorizationHeader(String url,String method,String username,String pass,String key,String secret){
          this.endpoint=url;
          this.method=method;
          this.username=username;
          this.password=pass;
          this.consumerKey=key;
          this.consumerSecret=secret;
      }
    }