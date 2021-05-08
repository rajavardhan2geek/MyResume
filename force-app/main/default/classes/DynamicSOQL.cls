public with sharing class DynamicSOQL {

    public class ChatOutput {
        @InvocableVariable
        public List<String> ObjectApiNamelist ;
    }
    @InvocableMethod(label='retreiveAllSObjects' description='retreiveAllSObjects')
    public static List<ChatOutput> getSObjects(){

        Map<String,SObjectType> sObjectsMap = Schema.getGlobalDescribe();
        List<String> objectList = new List<String>();
        ChatOutput output = new ChatOutput();
        objectList.addAll(sObjectsMap.keyset());
        output.ObjectApiNamelist =objectList;
        List<ChatOutput> ChatOutputlist = new List<ChatOutput>();
        ChatOutputlist.add(output);
        return ChatOutputlist;
    }
}