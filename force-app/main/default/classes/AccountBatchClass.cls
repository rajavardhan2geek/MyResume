global class AccountBatchClass implements Database.Batchable<sObject>,Database.Stateful{
    
    global Integer accountsList;
    global String query;
   
    global AccountBatchClass(String q){
        query='select Id ,NumberOfEmployees from Account';
        accountsList=0;
      }
    global  Database.QueryLocator start(Database.BatchableContext bc){
         System.debug(' query '+query);
        return Database.getQueryLocator(query	);
    }
    global  void execute(Database.BatchableContext bc,List<Account> scope){
        List<Account> accountList = new List<Account>();
        for(Account  acc: scope)
        {
            // accountsList = Integer.valueOf(acc.NumberOfEmployees)+accountsList;
             acc.NumberOfEmployees=1;
             accountList.add(acc);
             System.debug(' Total mnumber of Employees in all accounts '+accountsList);

        }
       
       // TriggerConstantUtils.bybatchPasseHandlers.add('AccountAfterUpdateHelper');
       // TriggerConstantUtils.bybatchPasseHandlers.add('AccountAfterInsertHelper');
        if(accountList.size()>0){
            update accountList;
        }
        System.debug('Taccounts value'+accountsList);
    }
    global void finish(Database.BatchableContext bc)
                       {
                           System.debug(bc.getJobId()+'batch job id');
                       }
            }