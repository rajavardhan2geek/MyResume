import { LightningElement,track,wire } from  'lwc';
import getAllaccounts  from '@salesforce/apex/AccountLWCController.getAllaccounts';
import getContact from '@salesforce/apex/AccountLWCController.getContact';

const DELAY = 300;
export default class busReservationLWCDemo extends LightningElement {


    @wire(getAllaccounts) accountsList;
 
    @track firstName = '';
   
    changeHandler(event) {
       const field = event.target.name;
       if(field==='fName')
        this.firstName =event.target.value;
       
    }
    @track accounts;

  
    @track currentAccount = '';
    @wire(getContact,{currentAccount:'$currentAccount'}) searchContacts;
  
    handleLoad() {
    
        getAllaccounts()
            .then(result=>
                    {
                        
                        this.accounts=result;
                        console.log(accounts);
                    })
            .catch(error => {
                this.error = error;
            });
    
    }

    handleKeyChange(event){

        window.clearTimeout(this.delayTimeout);
        const searchKey = event.target.value;
        this.delayTimeout = setTimeout(() => {
            this.currentAccount = searchKey;
        }, DELAY);
    }
    
}