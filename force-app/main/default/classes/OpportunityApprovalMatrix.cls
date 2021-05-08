public class OpportunityApprovalMatrix {

    
    public static void checkDuplicateOlis(List<OpportunityLineItem> oliList)
    {
        Set<Id> oppidset= new Set<Id>();
        Map<Id,List<OpportunityLineItem>> opplineitemMap = new Map<Id,List<OpportunityLineItem>>();
        Map<Id,Opportunity> oppMap = new Map<Id,Opportunity>();
        Map<String,Integer> oppprodcountMap = new Map<String,Integer>(); 
        for(OpportunityLineItem oli:oliList)
        {
            oppidset.add(oli.OpportunityId);
        }
        List<Opportunity> oppprodlist = [select Id, Name ,(select Id,Product2Id,OpportunityId from Opportunity.OpportunityLineItems ) from Opportunity where Id in :oppidset];
   		for(Opportunity opp:oppprodlist)
        {
            if(opplineitemMap != null)
            {
				if(!opplineitemMap.containsKey(opp.Id))
                {
                    List<OpportunityLineItem> olis = new List<OpportunityLineItem>();
                    olis.addAll(opp.OpportunityLineItems);
                    opplineitemMap.put(opp.Id,olis);
                    System.debug(opplineitemMap+'    ');
                }
                else
                {
                     List<OpportunityLineItem> olis  = opplineitemMap.get(opp.Id);
                      olis.addAll(opp.OpportunityLineItems);
                    opplineitemMap.put(opp.Id,olis);
                     System.debug(opplineitemMap+'contains    ');
                    
                }
            }
          
           
		}
        for(Id oppid:opplineitemMap.keySet())
        {
            List<OpportunityLineItem>  oppolilist = opplineitemMap.get(oppid);
            for(OpportunityLineItem oli :oppolilist)
            {
                 String oppproductIds =oli.OpportunityId+(String) (oli.Product2Id);
                System.debug(' oppproductIds '+oppproductIds +' '+oli );
                if(oppprodcountMap != null)
                {
                   
                    if(oppprodcountMap.containsKey(oppproductIds))
                    {
                        Integer prodcnt= oppprodcountMap.get(oppproductIds);
                        prodcnt =prodcnt+1;
                        oppprodcountMap.put(oppproductIds,prodcnt);
                    }
                   else
                    {
                  	 System.debug(oppprodcountMap +' opp product cnt map');
                   	 oppprodcountMap.put(oppproductIds,1);
                    
               		 }
                }
                
               
            }
           
        }
        System.debug(oppprodcountMap +' opp product cnt map');
    	sendMailtoOppTeam(oppprodcountMap,opplineitemMap,oppprodlist);
    }
    
    public static void sendMailtoOppTeam(Map<String,Integer> oppprodcountMap , Map<Id,List<OpportunityLineItem>> opplineitemMap,List<Opportunity> opplist)
    {
        List<Messaging.SingleEmailMessage> maillinglist = new    List<Messaging.SingleEmailMessage>();
       Boolean flag=false;

        for(Opportunity opp :opplist )
        {
           for(OpportunityLineItem oli:opp.OpportunityLineItems)
           	{
                String oppprodkey = oli.OpportunityId+(String) oli.Product2Id;
                if(oppprodcountMap.get(oppprodkey)>1)
                   {
                    flag=true;
                    break;                
                   }
              }	
          if(flag)
          {
        		Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
           			List<String> toAddressess = new List<String>();
                    toAddressess.add('rajavardhan1290@gmail.com');
                    mail.setToAddresses(toAddressess);               
                    mail.setSubject('Duplicate Products for Opportunity'+opp.Name);
                    mail.setPlainTextBody('Duplicate Products found in Opportunity Line Items'+opp.OpportunityLineItems);
                    maillinglist.add(mail);
      		 
          }
        }
         Messaging.sendEmail(maillinglist);
    }
    public static list<Approval.ProcessResult> ApprovalMatrixMatch(Set<Id> OpportntyIDs)
    {
        List<Opportunity> updatedoppr=new List<Opportunity>();
        Set<String> countryset=new Set<String>();
        List<Opportunity> opptyid= new List<Opportunity>();
        Map<Id,Approval_Matrix__c> approvalmatrixmap= new Map<Id,Approval_Matrix__c>();
        List<Opportunity> opptyList =[select Id,Name,Status__c,Country__c,Approver1__c,Approver2__c from Opportunity where Id in:OpportntyIDs];
        for(Opportunity opprec :opptyList)
        {
           
            countryset.add(opprec.Country__c);
        }
        List<Approval_Matrix__c> approvalMatrixList= [select Approver1__c,Approver2__c,Country__c from Approval_Matrix__c where Country__c in :countryset];
        for(Opportunity opprec: opptyList )
          
        {
            for(Approval_Matrix__c approvalmatrix:approvalMatrixList){
            if(opprec.Country__c==approvalmatrix.Country__c)
            {
                opprec.Approver1__c =approvalmatrix.Approver1__c;
                opprec.Approver2__c =approvalmatrix.Approver2__c;
                opprec.Status__c ='open'; 
                updatedoppr.add(opprec);
                opptyid.add(opprec);
            }
        }
        }
        update updatedoppr;
        List<Approval.ProcessSubmitRequest> submitopptylisy= new List<Approval.ProcessSubmitRequest>();
        for(Opportunity oppid:opptyid)
        {
            
            Approval.ProcessSubmitRequest req= new Approval.ProcessSubmitRequest();
            req.setComments('Submit oppt for approval');
            req.setObjectId(oppid.id);
            req.setNextApproverIds(new Id[] {oppid.Approver1__c});
            submitopptylisy.add(req);
        }
        List<Approval.ProcessResult> preslist= new List<Approval.ProcessResult>();
         for(Approval.ProcessSubmitRequest pres :submitopptylisy)
         {
             Approval.ProcessResult rsult =Approval.process(pres);
             System.debug(' '+rsult.getInstanceId()+'id'+rsult.getInstanceStatus()+'erer'+rsult.getErrors());
           
				
			
             

             preslist.add(rsult);
         }
         return preslist;
    }
}