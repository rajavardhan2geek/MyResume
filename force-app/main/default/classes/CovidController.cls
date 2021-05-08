global class CovidController {
    global CovidController() {
      Account acc=[select Id,ShippingAddress from Account];
        
    }

        @AuraEnabled(cacheable=true)
    global static  List<Districtcoviddata> fetchDistrictData(String stateinp){
         Http http= new Http();
        HttpRequest covidreq= new HttpRequest();
        covidreq.setMethod('GET');
        covidreq.setEndpoint('https://api.covid19india.org/state_district_wise.json');
        HttpResponse covidresponse = http.send(covidreq);
        JSONParser parser = JSON.createParser(covidresponse.getBody());
       
         // System.debug(covidresponse.getBody());
        Map<String,DistrictData> stateDistMap = new Map<String,DistrictData>();
        stateDistMap = ( Map<String,DistrictData>) JSON.deserialize(covidresponse.getBody(), Map<String,DistrictData>.class);
         Map<String,Districtcoviddata> districtCovidMap =  stateDistMap.get(stateinp).districtData;
        for(String district : districtCovidMap.keySet() ){
            
            Districtcoviddata currentdistrict = districtCovidMap.get(district);
            currentdistrict.district = district;
        }
        
        //System.debug(' TS district are '+stateDistMap.get(stateinp).districtData.keySet());
        return  districtCovidMap.values();
    }
   
    global class DistrictData{
        
         @AuraEnabled 
         public  Map<String,Districtcoviddata> districtData;
        
      
    }
    global class Districtcoviddata{
         @AuraEnabled
        global Integer active;
          @AuraEnabled
        global Integer confirmed;
         @AuraEnabled
        global Integer deceased;
          @AuraEnabled
        global Integer recovered;
		
		   @AuraEnabled
        global String  notes;
        @AuraEnabled 
        global Delta delta;
        @AuraEnabled
        global String district;
    }
    global class Delta{
         @AuraEnabled
        global Integer  confirmed;
         @AuraEnabled
        global Integer  deceased;
         @AuraEnabled
         global Integer recovered;
        }
    
    @AuraEnabled(cacheable=true)
    global static  List<States> fetchtravelHistory(){
     
        Http http= new Http();
        HttpRequest covidreq= new HttpRequest();
        covidreq.setMethod('GET');
        covidreq.setEndpoint('https://api.covid19india.org/data.json');
        HttpResponse covidresponse = http.send(covidreq);
        JSONParser parser = JSON.createParser(covidresponse.getBody());
         List<States> coviddataList= new List<States>();
         CovidData coviddata = (CovidData) parser.readValueAs(CovidData.class);
   /*
      while(parser.nextToken() != null  ){
        //   System.debug(parser.getCurrentName());
            if(parser.getCurrentToken() == Jsontoken.START_ARRAY && parser.getCurrentName() == 'statewise'){
                coviddataList = (States[]) parser.readValueAs(States[].class);
                }
        }*/
      //  System.debug(' ***** '+coviddataList);
     /*   for(States state : coviddataList){
            state.lastupdateddate = Datetime.parse(appendAMorPMtoDate(state.lastupdatedtime));
        }*/
        return coviddata.statewise;
    }

    private static String appendAMorPMtoDate(String dtexpression){
        
      /* Pattern pat = Pattern.compile(' ');
       Pattern pat2 = Pattern.compile(':');
       String timeexp = pat.split(dtexpression)[];
       Integer timeofday = Integer.valueOf(pat2.split(timeexp)[0]);
        System.debug(timeofday <12 ? dtexpression + ' am' : dtexpression + ' pm');*/
        String newdtexpr = dtexpression.substring(0,dtexpression.length()-3);
       return newdtexpr;
        
    }
    global class CovidData{

     
        @AuraEnabled 
        global List<Object> stateslist;
          @AuraEnabled 
        global List<States> statewise{get;set;}
          @AuraEnabled 
        global List<Object> stateslist3;
            
        }
    
    global class States{
        
        @AuraEnabled 
        global String statecode;
          @AuraEnabled 
        global String state;
         @AuraEnabled
        global String active;
         @AuraEnabled
        global String confirmed;
        @AuraEnabled
        global String recovered;
         @AuraEnabled
	    global String deaths;
         @AuraEnabled
        global String deltaconfirmed;
         @AuraEnabled
        global String deltadeaths;
         @AuraEnabled
		global String deltarecovered;
         @AuraEnabled
		global String lastupdatedtime;
        
        @AuraEnabled 
        global Datetime lastupdateddate 
        {
            get;
            set;
        }
    }
    }