public with sharing class VaccinationService {
    public VaccinationService() {

    }


    public void getVaccineSlots(){
        HttpRequest request= new HttpRequest();
        request.setEndpoint('https://cdn-api.co-vin.in/api/v2/admin/location/states');
        request.setMethod('GET');
        request.setHeader('accept', 'application/json');
        request.setHeader('Accept-Language', 'hi_IN');
        Http http=new Http();
        HttpResponse response= http.send(request);
         System.debug(response.getStatusCode()+' '+response.getStatus());
    }
}
