public class AccountBeforeLogicHandler {
		
    public AccountBeforeLogicHandler(){
        
    }
    public void prePopulateAccountBeforeUpdate(Map<Id,Account> newAccMap,Map<Id,Account> oldAccMap){
        
        for(Account newAccount :newAccMap.values()){
            Account oldAccount=oldAccMap.get(newAccount.Id);
            if(newAccount.ParentId != oldAccount.ParentId){
                	newAccount.addError('Parent Account Cannot be Changed');
            }
        }
        
    }
}