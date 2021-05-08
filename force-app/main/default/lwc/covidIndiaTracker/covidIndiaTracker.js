import { LightningElement,track,wire } from 'lwc';
import  fetchcoviddata from './fetchCovidData'
import fetchCovidTravel  from '@salesforce/apex/CovidController.fetchtravelHistory'; 

export default class CovidIndiaTracker extends LightningElement {


    @track selectedstate;
   
    @track data =[];
    @track totalcases =[];
    @wire(fetchCovidTravel) covidlist(value){
        if(value.data){
            console.log(JSON.stringify(value.data));
            this.totalcases = value.data.slice(0,1);
            this.data =value.data.slice(1,value.data.length);
        }
    };
    onHandleSort(event){
            console.log('sorted')
    }
    searchDistricts(event){
        this.selectedstate =event.target.name;
        console.log(' passed value' +event.target.name);
    }
}