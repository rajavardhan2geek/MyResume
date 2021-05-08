import { LightningElement ,api,track,wire} from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';
//import boats from '@salesforce/resourceUrl/boats';

const fields = [
	'Boat__c.Name',
	'Boat__c.Year_Built__c',
	'Boat__c.Description__c'
];
export default class BearLocation extends LightningElement {

    @api recordId;
    @track boat;
    @wire(getRecord, { recordId: '$recordId', fields })
    loadBoat({error,data}){

        if(error){
            //error 
        }
        else if(data){
            //data 
            console.log('   data'+data.fields.Name.value);
            this.boat =data.fields.Name.value;

        }
    }
}