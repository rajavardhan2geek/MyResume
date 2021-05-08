public class Handlegreet implements BotHandler {

    public BotMessage handle(String command)
    {
       String message ='Hello'+UserInfo.getFirstName()+'\nYou Can use help to know what can i do';
        BotMessage  bt=new BotMessage('Bot',message);
       return bt;   
    }
    
}