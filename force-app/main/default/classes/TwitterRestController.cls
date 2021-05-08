public class TwitterRestController {
    
    
    
    public static void getAuthenticateTwitter(){
        Http twitter = new Http();
        HttpRequest request= new HttpRequest();
        request.setEndpoint('https://api.twitter.com/oauth2/token');
        request.setMethod('POST');
        String consumerKey ='7PXiykTJB4lK1RXyhRMNZeATT';
        String secret='9mVpPtxE8dntmvXSi8MHVIZW9LI3801sDsJaEe0LN6KWe0ss65';
        Blob headerValue = Blob.valueOf(consumerKey+':'+secret);
        String authorizationHeader = 'Basic ' + EncodingUtil.base64Encode(headerValue); 
        request.setHeader('Authorization', authorizationHeader); 
        request.setBody('grant_type=client_credentials');
        HttpResponse response = twitter.send(request);
        System.debug(response.getBody());
        String stoken;
        JSONParser parser = JSON.createParser(response.getBody());
        while (parser.nextToken() != null) {
            if (parser.getCurrentToken() == JSONToken.FIELD_NAME && parser.getText() == 'access_token'){
                parser.nextToken();
                stoken = parser.getText();
            }
        }
        getTweets(stoken);
    }
    public static void getTweets(String accesstoken){
        Http twitter = new Http();
        HttpRequest twitrequest= new HttpRequest();     
        twitrequest.setEndpoint('https://api.twitter.com/1.1/search/tweets.json?q=salesforce');
        twitrequest.setMethod('GET');
        String authorizationHeader = 'Bearer ' + accesstoken;
        twitrequest.setHeader('Authorization', authorizationHeader);
        // twitreq.setBody('grant_type=client_credentials');
        HttpResponse response = twitter.send(twitrequest);
        Map<String,Object> twitterlist;
       
                twitterlist=  (Map<String,Object> )JSON.deserializeUntyped(response.getBody());
          
        
            System.debug(twitterlist.get('statuses'));
        
    }
    public class TwitterData{
        @AuraEnabled
        public String created_at{get;set;}
        @AuraEnabled
        public String text{get;set;}
        @AuraEnabled
        public List<String> hashtags{get;set;}
         @AuraEnabled
        public List<String> symbols{get;set;}
        
    }
}