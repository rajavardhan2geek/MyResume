public with sharing class RecordDAO {

    public List<ProcessInstanceWorkitem> getProcessInstances(){
        List<ProcessInstanceWorkitem> processWorkItems=[select Id,Actor.Name,ProcessInstance.TargetObject.id,ProcessInstance.TargetObject.Name,ProcessInstanceId,ProcessInstance.Status from ProcessInstanceWorkitem ];
        return processWorkItems;

    }
    public void updateProcessWorkItems(List<ProcessInstanceWorkitem> processWILines){
          System.debug(processWILines);
    }
    public void updateProcessWorkItem(Id workItemid,String statusAction){
        Approval.ProcessWorkitemRequest request = new Approval.ProcessWorkitemRequest();
        request.setComments(statusAction);
        request.setAction(statusAction);
        request.setWorkitemId(workItemid);
        List<Approval.ProcessRequest> prreqList=new List<Approval.ProcessRequest>();
        prreqList.add(request);
        List<Approval.ProcessResult> resultList =  Approval.process(prreqList);

        System.debug(resultList.get(0).getInstanceId()+' status '+resultList.get(0).getInstanceStatus());
  }
    public     List<ProcessDefinition>  getProcessDefinition(){
        List<ProcessDefinition> processDefList=[select Id ,Name,State,TableEnumOrId from ProcessDefinition];
        return processDefList;
    }
      public  List<ProcessInstance>  getProcessInstanceList(){
        List<ProcessInstance> processDefList=[select Id,ProcessDefinition.Name,ProcessDefinition.TableEnumOrId ,Status ,TargetObject.Name from ProcessInstance ];
        return processDefList;
    }
}