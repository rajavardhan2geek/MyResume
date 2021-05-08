const recordMetadata = [
    { label: 'accuracylocation', fieldName: 'accuracylocation' },
    { label: 'address', fieldName: 'address', type: 'text' },
    { label: 'datasource', fieldName: 'datasource', type: 'url' },
    { label: 'latlong', fieldName: 'latlong', type: 'text' },
    { label: 'modeoftravel', fieldName: 'modeoftravel', type: 'text' },
    { label: 'pid', fieldName: 'pid', type: 'text' },
    { label: 'placename', fieldName: 'placename', type: 'text' },
    { label: 'timefrom', fieldName: 'timefrom', type: 'text' },
    { label: 'timeto', fieldName: 'timeto', type: 'text' },
    { label: 'type', fieldName: 'type', type: 'text' } 
];

import fetchCovidTravel  from '@salesforce/apex/CovidController.fetchtravelHistory'; 
export default function fetchCovidData({ amountOfRecords }) {
    console.log(' calling server side function ');
    fetchCovidTravel();
   

}