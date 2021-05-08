import { LightningElement ,wire} from 'lwc';
import getSobjectsList from '@salesforce/apex/SObjectExplorerClass.getSObjects'
export default class DragObjectsLwc extends LightningElement {

    @wire(getSobjectsList)sobjectsList;

    handleDragStart(event){
        event.dataTransfer.setData("account_id", event.target.dataset.item);
    }
}