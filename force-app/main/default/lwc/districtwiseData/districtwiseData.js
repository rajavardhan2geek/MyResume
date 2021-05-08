import {LightningElement ,track,api,wire} from 'lwc';
import fetchDistrictData  from '@salesforce/apex/CovidController.fetchDistrictData';
export default class DistrictwiseData extends LightningElement {
    @track districtList =[];
    @api state;
    @wire(fetchDistrictData,{'stateinp':'$state'}) getDistricts(value){
        if(value.data){
            console.log(JSON.stringify(value.data));
          
            this.districtList =value.data;
        }
    };
}