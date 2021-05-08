public class TwitterController {

    @AuraEnabled(cacheable=true)
    public static List<Twitter> getTwitter(){
        
        return null;
    }
    public class Twitter{
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