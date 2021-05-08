import { LightningElement } from 'lwc';

export default class DropObjectLwc extends LightningElement {

    accountId;
    message;
    allowDrop(event){
        event.preventDefault();
    }
    dropElement(event){
        this.accountId = event.dataTransfer.getData("account_id");
        this.message = '';  
    }
}