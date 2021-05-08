public with sharing class ApprovalBO {



    @AuraEnabled
    public static void processApprovals(Id workItemId,String status){
        RecordDAO recorddao= new RecordDAO();
        recorddao.updateProcessWorkItem(workItemid,status);
       // System.debug();

    }
    @AuraEnabled(cacheable=true)
    public static List<ApprovalProcessItems> getAllWorkItems(){
        try {
            RecordDAO recorddao= new RecordDAO();
            List<ApprovalProcessItems> approvalWIItems= new List<ApprovalProcessItems>();
            for(ProcessInstanceWorkitem workItem:recorddao.getProcessInstances()){
                ApprovalProcessItems approvalWI= new ApprovalProcessItems();
                approvalWI.workItemId=workItem.Id;
                approvalWI.approver=workItem.Actor.Name;
                approvalWI.status=workItem.ProcessInstance.Status;
                approvalWI.targetObject=workItem.ProcessInstance.TargetObject.Id;
                approvalWI.targetObjectName=workItem.ProcessInstance.TargetObject.Name;
                approvalWIItems.add(approvalWI);

            }
            return approvalWIItems;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    public class ApprovalProcessItems{

        @AuraEnabled
        public Id workItemId;
        @AuraEnabled
        public String status;
        @AuraEnabled
        public String approver;
        @AuraEnabled
        public Id targetObject;
        @AuraEnabled
        public String targetObjectName;

    }
}