public class BatchClass implements Database.Batchable<sObject>,Database.AllowsCallouts{
    public Database.QueryLocator start(Database.BatchableContext bc){
        HttpRequest req= new HttpRequest();
        req.setEndpoint('https://api.covid19india.org/state_district_wise.json');
        req.setMethod('GET');
        Http hserver = new Http();
        HttpResponse resp = hserver.send(req);
        System.debug(resp.getBody()+'resp');
        System.debug(System.Limits.getCallouts()+'callout'+System.Limits.getLimitCallouts());
        return Database.getQueryLocator([select Id from Account]);
    }
    public void execute(Database.BatchableContext bc,List<sObject> scope){
        System.debug(scope);
        HttpRequest req= new HttpRequest();
        req.setEndpoint('https://api.covid19india.org/state_district_wise.json');
        req.setMethod('GET');
        Http hserver = new Http();
        HttpResponse resp = hserver.send(req);
         System.debug(System.Limits.getCallouts()+'execute'+System.Limits.getLimitCallouts());
    }
    public void finish(Database.BatchableContext bc){
           HttpRequest req= new HttpRequest();
        req.setEndpoint('https://api.covid19india.org/state_district_wise.json');
        req.setMethod('GET');
        Http hserver = new Http();
        HttpResponse resp = hserver.send(req);
        System.debug(resp.getBody()+'resp');
        System.debug(System.Limits.getCallouts()+'callout finish'+System.Limits.getLimitCallouts());
    }

}