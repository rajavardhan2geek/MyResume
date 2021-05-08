public class BotController {
    
     class HandlerMapping
    {
   		public String handlerClassName;
        public Pattern utterancePattern;

        public HandlerMapping(String handlerClassName, String patternStr) {
            this.handlerClassName = handlerClassName;
            this.utterancePattern = Pattern.compile(patternStr);
        }
    }
    static List<HandlerMapping> handlemappings;
    static 
    {
        List<ChatBot__c> commands =[select Apex_Class__c,Pattern__c from ChatBot__c];
        System.debug(commands);
        List<HandlerMapping> mappings = new List<HandlerMapping>();
        for(ChatBot__c command :commands)
        {
           mappings.add(new HandlerMapping(command.Apex_Class__c,command.Pattern__c));
        }
        handlemappings=mappings;
    }
    @AuraEnabled
    public static  BotMessage  submit(String utterance)
    {
        try
        {
        for(HandlerMapping mapcommands:BotController.handlemappings)
        {
            	System.debug(utterance+'pattern' +mapcommands.utterancePattern);
             	Matcher utteranceMatcher = mapcommands.utterancePattern.matcher(utterance);
                if (utteranceMatcher.matches()) {
                    Type t = Type.forName('', mapcommands.handlerClassName);
                    BotHandler h = (BotHandler)t.newInstance();
                    return h.handle(utterance);
         		 }
          }
        return new  BotMessage('Bot','I cannot help ');
        }
    
        catch(Exception e){System.debug(' Exception e'+e); return new  BotMessage('Bot','OH!!!Something went wrong ');}}
	}