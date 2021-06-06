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

    Cache.OrgPartition orgPart = Cache.Org.getPartition('local.expenseConverterCache');
    orgPart.put('DollarToEuroRate','75.0');
     String cachedRate = (String)orgPart.get('DollarToEuroRate');
     System.debug(cachedRate);