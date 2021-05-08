public class FormResponseController {
    
    private  List<Form_Section__c> formsections;
    private  List<FormFields__c> formfieldnames;
    private  List<FormResponse__c> formresponses;
    public FormResponseController(ApexPages.StandardController controller)
    {
        initSections();
        initFields();
      
        getSectionFieldWrapper(formsections,formfieldnames);
    }
    
   
    private void initSections()
    {
        String soqlString ='select Id,Name from Form_Section__c';
         formsections=Database.query(soqlString); 
    }
    private void initFields()
    {
        String soqlString = 'select Id,FieldName__c,FieldType__c,Form_Section__c from FormFields__c ';
         formfieldnames = Database.query(soqlString);
    }
   
    public List<SectionWrapper> sectionwrappers{get;set;}
    public Class SectionWrapper
    {
        public String secname{get;set;}
        public List<SectionFieldWrapper> sectionfieldwrapper{get;set;}
        SectionWrapper()
        {}
        
    }
   public Class SectionFieldWrapper
      {
          public String fieldapiname {get;set;}
          public  String fieldtype{get;set;}
       	     SectionFieldWrapper(String apiname,String type)
             {
                 this.fieldapiname =apiname;
                 this.fieldtype =type;
             }
       }
 /*   public List<Form_Section__c> getSectionNames()
    {
        String soqlString ='select Name from Form_Section__c';
        formsections=Database.query(soqlString);
        return formsections;
    }
    public List<FormFields__c> getFieldNames()
    {
        System.debug('fdf');
        String soqlString = 'select FieldName__c,FieldType__c from FormFields__c where Form_Section__c in (select id from Form_Section__c where Name =\'Basic Information\')';
         formfieldnames = Database.query(soqlString);
        return formfieldnames;
    }
    */
    private void getSectionFieldWrapper(List<Form_Section__c> formsections, List<FormFields__c> formfieldnames)
    {
        sectionwrappers= new List<SectionWrapper>();
        for(Form_Section__c fsec:formsections)
        {
         	SectionWrapper secwrapp = new  SectionWrapper();
            secwrapp.secname = fsec.Name;
            secwrapp.sectionfieldwrapper = new  List<SectionFieldWrapper>();
            for(FormFields__c ffname:formfieldnames)
            {
                SectionFieldWrapper sectionfieldwrapper;
                if(fsec.Id == ffname.Form_Section__c)
                {
                    
                    secwrapp.sectionfieldwrapper.add(new SectionFieldWrapper(ffname.FieldName__c, ffname.FieldType__c));
                    
                }
                  
            }
            sectionwrappers.add(secwrapp);
        }
    }
}