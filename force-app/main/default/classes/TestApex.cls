@isTest
public class TestApex {
    
    
    public static testmethod void getusername()
    {
        Account acc= new Account(Name='Test');
        insert acc;
       
        Group group1 = new Group(Name='TestShare');
        insert group1;
    	 AccountShare accshare= new AccountShare(AccountId=acc.Id,UserorGroupId=group1.Id,AccountAccessLevel='Edit',OpportunityAccessLevel='Read',RowCause='Manual');
        insert accshare;
    }
}