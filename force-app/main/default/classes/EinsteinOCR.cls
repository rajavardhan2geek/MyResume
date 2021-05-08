public with sharing class EinsteinOCR {
    public static String VISION_API = 'https://api.einstein.ai/v2/vision/ocr';
  public static String getCDUrl(){
        return null;
  }
  public static void postImage(){
      String access_token = getAccessToken();
      System.debug('access token'+access_token);
      HttpRequest req =new HttpRequest();
      req.setEndpoint(VISION_API);
      String beareraccess ='Bearer '+access_token;
      
      req.setHeader('Cache-Control', 'no-cache');
      req.setHeader('content-type', HttpFormBuilder.GetContentType());
      req.setHeader('Authorization' ,beareraccess);
      req.setMethod('POST');
    // ContentDistribution cd =[select DistributionPublicUrl from ContentDistribution where ContentDocumentId='0697F00000mOaB6QAK' limit 1];
     // String imageurl =cd.DistributionPublicUrl;
      
      ContentVersion content = [SELECT Title,VersionData FROM  ContentVersion  where ContentDocumentId ='0697F00000mOaB6QAK'    LIMIT 1];
            String sample = EncodingUtil.base64Encode(content.VersionData);
      string form64 = '';        
        form64 += HttpFormBuilder.WriteBoundary();
       form64 += HttpFormBuilder.WriteBodyParameter('modelId', EncodingUtil.urlEncode('OCRModel', 'UTF-8'));
        
        form64 += HttpFormBuilder.WriteBoundary();
       form64 += HttpFormBuilder.WriteBodyParameter('sampleBase64Content', sample);
        form64 += HttpFormBuilder.WriteBoundary(HttpFormBuilder.EndingType.CrLf);
        
        blob formBlob = EncodingUtil.base64Decode(form64);
        string contentLength = string.valueOf(formBlob.size());
        req.setBodyAsBlob(formBlob);
        
        req.setHeader('Connection', 'keep-alive');
        req.setHeader('Content-Length', contentLength);
        req.setTimeout(60*1000);
              Http h = new Http();
        String resp;
      try {
            HTTPResponse res = h.send(req);
            if (res.getStatusCode() == 200) {
         	 JSONParser parser = JSON.createParser(res.getBody());
					List<PredictResponse> plist = new List<PredictResponse>();
                  while (parser.nextToken() != null) {
                  
                      if ((parser.getCurrentToken() == JSONToken.FIELD_NAME) && (parser.getText() == 'probabilities')){
                          parser.nextToken();
						//System.debug(parser.nextValue());
                     //     List<PredictResponse>  pr =(List<PredictResponse>.class)JSON.deserialize(parser,List<PredictResponse>.class);
                          plist= (List<PredictResponse>)parser.readValueAs(List<PredictResponse>.class);
                          //plist.add(pr); 
                         	 System.debug(plist.size());  
                      }

                  
                  }
                for(PredictResponse p:plist)  {
                    System.debug(p.label);
                }      
               
               
            }
        } catch(System.CalloutException e) {
            System.debug('ERROR:' + e.getStackTraceString());
            
        }

  }
  public static String getAccessToken(){
   List<ContentVersion> private_key=[SELECT Title, VersionData FROM ContentVersion where ContentDocumentId='0697F00000mOw0sQAC'];
       
      if(private_key.size()>0){
          String  keyContents = private_key[0].VersionData.tostring();
          keyContents = keyContents.replace('-----BEGIN RSA PRIVATE KEY-----', '');
        keyContents = keyContents.replace('-----END RSA PRIVATE KEY-----', '');
        keyContents = keyContents.replace('\n', '');
        JWT jwt = new JWT('RS256');
	
        jwt.pkcs8 = keyContents; 
        jwt.iss = 'developer.force.com';
        jwt.sub = 'rajavardhan1290@gmail.com';
        jwt.aud = 'https://api.einstein.ai/v2/oauth2/token';
        jwt.exp = '3600';
        String access_token = JWTBearerFlow.getAccessToken('https://api.einstein.ai/v2/oauth2/token', jwt);
          System.debug(access_token+'access_token');
          return access_token;  }
      else
          return null;
    }
}