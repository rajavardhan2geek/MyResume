public with sharing class Extension1 {

public Extension1(ApexPages.StandardController controller){
}
    
    
    public String name{get;set;}
    public  Set<String>  getHello(){

        Set<String> listofStrings = new Set<String>();
         for(Integer i=0;i<1000;i++)
         {
            String greet ='Hello'+i;   
             listofStrings.add(greet);
         }
        return listofStrings;
    }
 public void save()
 {
      System.debug('extension 1');
	Contact con= new Contact(LastName='last');
    Savepoint sp = Database.setSavepoint();
     con.FirstName=' savepoint';
      insert con;
     Savepoint sp2 =Database.setSavepoint();
     con.FirstName='first savepoint';
     upsert con;
      Savepoint sp3 =Database.setSavepoint();
     con.FirstName='second savepoint';
     upsert con;
     Database.rollback(sp3);
     //Database.rollback(sp2);
    
  }
}