@RestResource(urlMapping='/CreateAccount')
global  class ServiceRequestApi {

    @HttpPost
    global static List<String> postAccount(List<RequestJSON> requestList){
        List<Account> newAccountList=new List<Account>();
        for(RequestJSON requestItem:requestList){
            Account account =new Account(Name=requestItem.orgName,AccountNumber__c=requestItem.AccountNumber);
	            System.debug(account);
            newAccountList.add(account);
            
        }
         Database.UpsertResult[] results;
        List<String> sucessIds;
        List<String> errors;
        if(newAccountList.size()>0)
        {
             results = Database.upsert(newAccountList,Schema.Account.AccountNumber__c);
              sucessIds=new List<String>();
            	errors=new List<String>();
            for(Database.UpsertResult res:results){
                if(res.isSuccess()){
                  
                    sucessIds.add(res.getId());
                }
                else{
                    for(Database.Error error:res.errors){
                        errors.add(error.getMessage());
                    }
                    
                }
            }
            
        }
        if(sucessIds.size()>0)
            return sucessIds;
        else
            return errors;
    }
    
}