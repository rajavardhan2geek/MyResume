public with sharing class CurlRequestClass {
    public CurlRequestClass() {

    }
	
    
    @AuraEnabled(cacheable=true)
    public static String sendRequestMethod(String authorizationHeader){

        
        
		AuthorizationHeader authHeader= (AuthorizationHeader)JSON.deserialize(authorizationHeader, AuthorizationHeader.Class);
        System.debug(authHeader);
        RequestProcessor reqProcessor=new RequestProcessor(authHeader);
        reqProcessor.routeProcessor();
        
        //return obj.getaccesstoken();
        return 'hello';
    }
   
}