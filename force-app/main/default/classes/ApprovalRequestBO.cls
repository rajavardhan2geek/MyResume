public class ApprovalRequestBO {

    public RecordDAO recordDao;
    public ApprovalRequestBO(){
        if(this.recordDao != null){
            this.recordDao= new RecordDAO();
        }
    }
    @AuraEnabled
    public static List<ProcessDefinition> getProcessDefinitionList(){
         RecordDAO recordDao = new RecordDAO();
        return recordDao.getProcessDefinition();
    }
     @AuraEnabled
    public static List<ProcessInstance> getProcessInstanceList(){
         RecordDAO recordDao = new RecordDAO();
        return recordDao.getProcessInstanceList();
    }
}