import { LightningElement } from 'lwc';
import { CurrentPageReference} from 'lightning/navigation';
import { fireEvent } from 'c/pubsub';
export default class Lwcchildeventfire extends LightningElement {

  
    notifyOwnerCmp(){
    this.template.querySelector('p').dispatchEvent(new CustomEvent('notify',{bubbles:false}));
    this.dispatchEvent(new CustomEvent('hostevent',{bubbles:true}));
    }
    handlenotify(){
        console.log('event in child cmp');
    }
    handlenotifyele(){
        console.log('event in child cmp on p where event fired');
    }
    accountclick(){
        console.log('fire event');
        fireEvent('inputChangeEvent','data sent');
    }
}