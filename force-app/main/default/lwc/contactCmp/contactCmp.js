import { LightningElement,wire ,track,api} from 'lwc';
import getContacts from '@salesforce/apex/AccountLWCController.getContacts'
import validateCMP from './contacthelper'
export default class ContactCmp extends LightningElement {


  @wire(getContacts) contactdatalist;
  @track contactMap;
  @api recordId;
  @api flexipageRegionWidth;
  @wire(getContacts,{'accountId':'$recordId'}) contacts({error,data}){

      if(error)
      {
        console.log(' error '+JSON.stringify(error));
      }
      else if(data)
      {
        console.log(' data below '+JSON.stringify(data));
        this.contactMap = data.map((contactobj,index)=>{
            return {contact : contactobj,
                     isMod5: index  
                    }
         
        });
        console.log(this.contacts);
        
      }

  };
 
  @track startpoint;
  @track endpoint;
  @track pagelimit;
  @track selectedContact;
  @track contactlist;
  numberItems = 0;
  constructor()
  {
      super();
      this.startpoint =0;
      this.endpoint=3;
      this.pagelimit =3;
      this.numberItems =5;
      this.contactlist= this.loaddata(1);
    
  }
  contactSelected(event)
  {
    console.log(' event handled'+ event.detail);
    const indexobj = event.detail;
    console.log(indexobj);
    this.selectedContact = this.contactMap[indexobj].contact;
    console.log();

  }
  get contactlist()
  {

    return this.contactlist;

  }
  set contactlist(value)
  {

  }

  loaddata(pagenumber)
  {
    var contactpagination =[];
    console.log(pagenumber);
    if(pagenumber>0)
    {
      var pageoofset = (pagenumber -1)*this.numberItems;
      console.log(pageoofset);
      for(var i=pageoofset;i<=(pagenumber*this.numberItems);i++)
      {
        contactpagination.push('hello'+i);
      }
      console.log(contactpagination);
    return contactpagination;
    }
  }

pagechangedhandler(event)
{
  const pagenumber = event.detail;
  console.log(pagenumber);
  this.contactlist = this.loaddata(pagenumber);
  
}
}