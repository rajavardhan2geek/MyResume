import { LightningElement,api } from 'lwc';
import { FlowAttributeChangeEvent, FlowNavigationNextEvent,FlowNavigationBackEvent } from 'lightning/flowSupport';

export default class FlowFooterNavigation extends LightningElement {

    @api headerAttr;
    @api
    availableActions = [];

    navigatePrevious(){
        if (this.availableActions.find(action => action === 'BACK')) {
            // navigate to the next screen
            const navigateNextEvent = new FlowNavigationBackEvent();
            this.dispatchEvent(navigateNextEvent);
        }

    }
    navigateNext(){
        if (this.availableActions.find(action => action === 'NEXT')) {
            // navigate to the next screen
            const navigateNextEvent = new FlowNavigationNextEvent();
            this.dispatchEvent(navigateNextEvent);
        }
    }

}