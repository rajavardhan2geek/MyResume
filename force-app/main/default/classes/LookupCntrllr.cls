public class LookupCntrllr {
/*
    @AuraEnabled
    public static String  getAccounts(String objname,String fname){
       String qstring = 'SELECT  '+fname+ ' FROM  '+objname ;
        List<sObject> objlist = Database.query(qstring);
        System.debug(objlist);
        List<ResultWrapper> reswrapper = new  List<ResultWrapper>() ;
        for(sObject obj :objlist)
            {
              reswrapper.add(new ResultWrapper(objname,fname,String.valueof(obj.get(fname))));
            }
       System.debug(reswrapper);
        return  JSON.serialize(reswrapper);
    }
     @AuraEnabled
    public static List<Contact> getContacts(){
        return [select Name from Contact];
    }

    @AuraEnabled(cacheable=true)
    public static List<SObject> doSearch(String objName,List<String> fields ,String searchValue){

        System.debug(fields);
        List<String> fieldNames = new List<String>();
        fieldNames.add('Id');
        fieldNames.add('Name');
        fieldNames.add('ProductCode');
        SOQLBuilder soqlquery = new SOQLBuilder(objName,fieldNames);
       
         List<SObject> sObjectResults ;
        try {

               
                soqlquery.getSOQLQuery().addcriteria('Name',searchValue);
                System.debug(' query '+soqlquery.SOQLQuery);             
                sObjectResults = Database.query(soqlquery.SOQLQuery); 
                return sObjectResults;
             } 
        catch (Exception e) {
             System.debug('Exception '+e.getMessage());
             return null;
             }
        
    }
    
    public class ResultWrapper
    {
        String objname {get;set;}
        String fname {get;set;}
        String fnamevalue{get;set;}
        ResultWrapper(String objname,String fna,String fnvalue ){
            this.objname=objname;
            this.fname=fna;
               this.fnamevalue=fnvalue;
        }
    }*/
}