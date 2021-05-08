import { LightningElement,api, wire } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
 import getOrderItems from '@salesforce/apex/OpportunityController.getOrderItems';
export default class OrderLwcCmp extends LightningElement {


    @api orderId;
    @wire(getOrderItems,{orderId :'$orderId'}) orderItems;

    handleSucess()
    {
        const event1 = new ShowToastEvent({
            title: 'Save',
            message: 'Record Saved Successfully',
        });
        this.dispatchEvent(event1);
    }

}