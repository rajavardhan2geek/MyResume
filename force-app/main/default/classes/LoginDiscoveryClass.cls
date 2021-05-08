global class LoginDiscoveryClass implements Auth.MyDomainLoginDiscoveryHandler {

    global PageReference login(String identifier, String startUrl, Map<String, String> requestAttributes) {
        
         User user = [select Id from User where username =:String.escapeSingleQuotes(identifier)];
        System.debug(startUrl+'dffd'+requestAttributes);
         return Auth.SessionManagement.finishLoginDiscovery(Auth.LoginDiscoveryMethod.password, user.Id); 
    }
}