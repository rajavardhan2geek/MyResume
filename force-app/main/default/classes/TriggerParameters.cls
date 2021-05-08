/**
 * Created By:Rajavardhan 
 * Description : TriggerParameters
 * */
public without sharing class TriggerParameters {

	
    public List<SObject> oldList { get; private set; }
	public List<SObject> newList { get; private set; }
	public Map<Id, SObject> oldMap { get; private set; }
	public Map<Id, SObject> newMap { get; private set; }

    
       public TriggerParameters() {
		
			
           if(Trigger.isBefore && Trigger.isInsert  ){
               this.newList = Trigger.new;
           }
           else if(Trigger.isAfter && Trigger.isInsert){
               this.newList = Trigger.new;
               this.newMap = Trigger.newMap;
           }
           else if(Trigger.isUpdate ){
               this.oldList = Trigger.old;
               this.oldMap = Trigger.oldMap;
               this.newList = Trigger.new;
               this.newMap = Trigger.newMap;
           }
            else if(Trigger.isDelete ){
               this.oldList = Trigger.old;
               this.oldMap = Trigger.oldMap;
           }
	}



}