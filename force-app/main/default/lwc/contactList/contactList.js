import { LightningElement,wire,track } from 'lwc';
import  {reduceErrors} from 'c/ldsUtils'; 
import CONTACT_OBJECT from '@salesforce/schema/Contact';
import FirstName_Field  from '@salesforce/schema/Contact.FirstName';
import LASTNAME_FIELD from '@salesforce/schema/Contact.LastName';
import EMAIL_FIELD from '@salesforce/schema/Contact.Email';
 import getContacts from '@salesforce/apex/ContactController.getContacts';
 const COLUMNS = [
    { label: 'FirstName', fieldName: FirstName_Field.fieldApiName, type: 'text' },
    { label: 'LastName', fieldName: LASTNAME_FIELD.fieldApiName, type: 'text' },
    { label: 'Email', fieldName: EMAIL_FIELD.fieldApiName, type: 'text' }
];
 export default class ContactList extends LightningElement {


   columns=COLUMNS;
  @track contacts1;
  @track  errors;
  @wire(getContacts) contacts;
  loadContacts(){
    
    getContacts().then(data=>{this.contacts1=data;})
    .catch(error=>{this.errors=reduceErrors(error);console.log('errror'+error);})

  }
  get errors(){
    return (this.contacts.error) ?
            reduceErrors(this.contacts.error) : [];

  }
  constructor(){
    super();
    this.loadContacts();
  }
   
    /* if(data)
    {
      this.contacts=data;
    }
    else if(error){
      this.error=error;
    }
  }*/
  

}