public class HandlerSOQL implements BotHandler {

    public BotMessage handle(String command)
    {
         List<Account> commands =[select Name from Account Limit 5];
     	
        List<String > msgs = new List<String> ();
        for(Account acc:commands)
        {
            msgs.add(acc.Name);
        }
       
        return new BotMessage('Bot','Top 5 Accounts',msgs);
        
    }

}