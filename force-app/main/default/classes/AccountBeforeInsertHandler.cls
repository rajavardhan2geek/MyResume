public class AccountBeforeInsertHandler {

    public void prePopulateAccount(List<Account> newAccountList){
                for(Account newAcc :newAccountList ){
                    newAcc.AccountNumber='12345';
                }
    }
}