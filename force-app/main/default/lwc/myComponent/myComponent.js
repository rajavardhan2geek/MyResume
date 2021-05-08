import { LightningElement ,wire,track} from 'lwc';
import { APPLICATION_SCOPE, createMessageContext, MessageContext, publish, releaseMessageContext, subscribe, unsubscribe } from 'lightning/messageService';
import SAMPLEMC from '@salesforce/messageChannel/commChannel__c';
import Channel from '@salesforce/messageChannel/SampleChannel__c';
export default class MyComponent extends LightningElement {
    subscription = null;
    receivedmessage;
    @wire(MessageContext) messageContext;
     message;
    connectedCallback() {
        this.subscribeToMessageChannel();
    }
    publishMsg(event){
        console.log(this.message);
        const message = {
            Sender: 'LWC Component',
            Message: this.message
        };
        publish(this.messageContext, Channel, message);


    }
    changeMSG(event)
    {
        console.log(event.target.value)
        this.message=event.target.value;
    }
    subscribeToMessageChannel(){
        if (!this.subscription) {
         this.subscription = subscribe(
                this.messageContext,
                Channel,
                (message) => this.handleMessage(message),
                { scope: APPLICATION_SCOPE }
            );
        }
    }
    handleMessage(message) {
        this.receivedmessage = JSON.stringify(message);
    }

}