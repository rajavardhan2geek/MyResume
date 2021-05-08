public class BotMessage {

    @AuraEnabled
    public String author{get;set;}
    @AuraEnabled
    public String  messagetext{get;set;}
    @AuraEnabled
    public List<String> msgs{get;set;}
    public BotMessage(String author,String msgtext)
    {
        this.author=author;
        this.messagetext=msgtext;
        
    }
     
     public BotMessage(String author,String msgtext,List<String> msgs)
    {
        this.author=author;
        this.messagetext=msgtext;
        this.msgs=msgs;
        
    }
}