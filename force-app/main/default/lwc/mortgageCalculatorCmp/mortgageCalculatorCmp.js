import { LightningElement,track } from 'lwc';
 
export default class MortgageCalculatorCmp extends LightningElement {


    @track termyear;
    @track active=true;
    @track inactive=false;
    handleTab(event)
    {
       // alert(event.target.getAttribute('aria-selected'));
      this.active = !this.active;
      this.inactive = !this.inactive;
    }

    get tabClass1(){

        return this.active ?'slds-tabs_default__item slds-is-active' :'slds-tabs_default__item';
    }
    get tabClass2(){

        return this.inactive ?'slds-tabs_default__item slds-is-active' :'slds-tabs_default__item';
    }
    get tabContentShow1(){

        return this.active ?'slds-tabs_default__content slds-show':'slds-tabs_default__content slds-hide';
    }

    get tabContentShow2(){

        return this.inactive ?'slds-tabs_default__content slds-show':'slds-tabs_default__content slds-hide';
    }

    get  termyearoptions(){

        var yearoptions =[{ label: '1 year ',value:'1 year'},{ label: '2 year ',value:'2 year'},{ label: '3 year ',value:'3 year'}];
        return yearoptions;
    }
    handleChange(){

    }
}