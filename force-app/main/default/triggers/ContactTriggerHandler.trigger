trigger ContactTriggerHandler on Contact (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
   // TriggerDispatcher.run(new ContactTriggerHandler() ,'Contact');

	TriggerDispatcher1.run(new ContactTriggerHandler1());
}