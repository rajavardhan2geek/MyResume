import { LightningElement,wire,track } from 'lwc';
import  getOpportunities from '@salesforce/apex/OpportunityController.getOpportunities'; 
import  {refreshApex} from '@salesforce/apex'; 
export default class OpportunityLWCCMP extends LightningElement {

@wire(getOpportunities) opportunityList;
@track columns = [
    { label: 'Name', fieldName: 'Name' },
    { label: 'Account', fieldName: 'AccountId' },
    { label: 'StageName', fieldName: 'StageName' },
];


handlerefresh(){

    return refreshApex(this.opportunityList);

}

}