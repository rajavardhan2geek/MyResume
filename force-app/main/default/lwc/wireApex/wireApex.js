import { LightningElement, wire } from 'lwc';
import getAccountList from '@salesforce/apex/AccountController.getAccountList';

const COLUMNS = [
    { label: 'Name', fieldName: 'Name', type: 'text' },
    { label: 'Phonenumber', fieldName: 'Phonenumber', type: 'Phone' },
    { label: 'Industry', fieldName: 'Industry', type: 'text' },
];
export default class WireApex extends LightningElement {

    columns= COLUMNS;
    @wire(getAccountList) accountList;



}