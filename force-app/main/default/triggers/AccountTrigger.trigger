trigger AccountTrigger on Account (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
   
     

  //  TriggerDispatcher.run(new AccountTriggerHandler());
  	   TriggerDispatcher1.run(new AccountTriggerHandler1());
}