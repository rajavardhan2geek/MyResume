import { LightningElement,api } from 'lwc';
import { RecordFieldDataType } from 'lightning/uiRecordApi';

export default class ContactListItem extends LightningElement {

@api contact;
@api indexVar;

selectHandler(event)
{
event.preventDefault();
const selectedcontactEvent = new CustomEvent('selectcontactid',{ detail:this.indexVar});
this.dispatchEvent(selectedcontactEvent);
  //console.log(' id '+this.contactitem.Id+' selectedcontact'+selectedcontactEvent.detail);
}

}