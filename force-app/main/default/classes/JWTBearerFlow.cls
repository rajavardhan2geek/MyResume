public class JWTBearerFlow {

    public static String getAccessToken(String tokenEndpoint, JWT jwt) {
    
         String grantType = 'urn:ietf:params:oauth:grant-type:jwt-bearer';
        String access_token = null;
        String body = 'grant_type='+EncodingUtil.urlEncode(grantType, 'UTF-8')+'&assertion=' + jwt.issue();
        HttpRequest req = new HttpRequest();                            
        req.setMethod('POST');
        req.setEndpoint(tokenEndpoint);
        req.setHeader('Content-Type', 'application/x-www-form-urlencoded');
        req.setBody(body);
        Http http = new Http();               
     HTTPResponse res = http.send(req);
        System.debug(res.getBody()+' res in JWT '+res.getStatusCode());
        if ( res.getStatusCode() == 200 ) {
            System.JSONParser parser = System.JSON.createParser(res.getBody());
            while (parser.nextToken() != null) {
                if ((parser.getCurrentToken() == JSONToken.FIELD_NAME) && (parser.getText() == 'access_token')) {
                    parser.nextToken();
                    access_token = parser.getText();
                    break;
                }
            }
        }
        return access_token;
        
    }

}