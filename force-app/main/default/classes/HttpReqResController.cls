public with sharing  class HttpReqResController {
	
    private Integration_Configuration__c icc{get;set;}
    public String resp{get;set;}
    public List<String> response{get;set;}
    public String consumerkey{get;set;}
    public String consumersecret{get;set;}
    public String selectmethod{get;set;}
    public String Authorizatiotype{get;set;}
    public List<SelectOption> method
    {   get{
        List<SelectOption> options = new List<SelectOption>();
        	options.add(new SelectOption('','',false));
            options.add( new SelectOption('GET', 'GET', false));
             options.add( new SelectOption('PUT', 'PUT', false));
             options.add( new SelectOption('DELETE', 'DELETE', false));
        	options.add( new SelectOption('POST', 'POST', false));
        	return options;
    }
        set;
     }
     public String url{get;set;}
    public List<SelectOption> Authorizationheader
    {
     get{ List<SelectOption> options = new List<SelectOption>();
         	options.add(new SelectOption('','',false));
            options.add( new SelectOption('BASIC', 'BASIC', false));
             options.add( new SelectOption('NoAuth', 'NoAuth', false));
             options.add( new SelectOption('OAuth', 'OAuth', false));
          options.add( new SelectOption('GET', 'GET', false));
      	options.add( new SelectOption('GET1None', 'GET1NOne', false));
        	return options;
        }
     set;}
    
    public void updateDropdown()
    {
        System.debug('update dropdown');
        for(SelectOption str:Authorizationheader)
          {
              System.debug(str+'dsd  '+selectmethod);
              
              if(selectmethod.equalsIgnoreCase(str.getValue())){
                  System.debug(str.getValue());
                  Authorizatiotype =str.getValue(); break;  }
              else
              {  Authorizatiotype =''; }
                  
          }
    }
    public HttpReqResController(ApexPages.StandardController stdctrl)
    {
        icc= new Integration_Configuration__c();
        
    }
    public PageReference cancel()
    {
       
        PageReference page = new PageReference('https://www.google.com') ;
          return page;
    }
    public void authorizeurl()
    {
        if(selectmethod=='GET')
        { ReqRespProcessor obj = new ReqRespProcessor(url,selectmethod,consumerkey,null);
         	
        	response=obj.sendResponse	(); 
        }
        else
        {
               ReqRespProcessor obj = new ReqRespProcessor(url,selectmethod,consumerkey,consumersecret);
            	resp=obj.getaccesstoken();
       		 System.debug(obj.getaccesstoken());
        }
    }
}