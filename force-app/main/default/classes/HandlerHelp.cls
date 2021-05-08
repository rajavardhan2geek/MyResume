public class HandlerHelp implements BotHandler{

  
    public List<BotMessage> botmessages{get;set;}
    public BotMessage handle(String command)
    {
         List<ChatBot__c> commands =[select Message__c from ChatBot__c];
     	
        List<String > msgs = new List<String> ();
        for(ChatBot__c chat:commands)
        {
            msgs.add(chat.Message__c);
        }
       System.debug(msgs);
        return new BotMessage('Bot','Things On Which  I Can  help are ',msgs);
        
    }
 
}