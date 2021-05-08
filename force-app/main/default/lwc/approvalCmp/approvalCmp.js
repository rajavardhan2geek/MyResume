import { LightningElement ,wire,api} from 'lwc';
import  getAllWorkItems from '@salesforce/apex/ApprovalBO.getAllWorkItems';
import  processApprovals from '@salesforce/apex/ApprovalBO.processApprovals';

import { NavigationMixin } from 'lightning/navigation';
export default class ApprovalCmp extends NavigationMixin(LightningElement) {

    approvalList=[];

    @wire(getAllWorkItems) approvalWIList;
    connectedCallback(){
        this.getAllInstances();
    }
    getAllInstances(){
        getAllWorkItems().then(
            data=>{
                if(data){
                    this.approvalList=data;
                }
            }
        )
    }
    navigatetoURL(event){
        console.log(JSON.stringify(event.currentTarget.dataset.key))
        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                recordId:event.currentTarget.dataset.key,
               // objectApiName: 'Company__', // objectApiName is optional
                actionName: 'view'
            }
        });
    }
    approveItem(event){
        console.log(JSON.stringify(event.currentTarget.dataset.key))
        let workItemid=event.currentTarget.dataset.key;
        processApprovals({workItemId:workItemid,status:'Approve'});

    }
    rejectItem(event){
        console.log(JSON.stringify(event.currentTarget.dataset.key))
        let workItemid=event.currentTarget.dataset.key;
        processApprovals({workItemId:workItemid,status:'Reject'});

    }
    reassignItem(event){
        console.log(JSON.stringify(event.currentTarget.dataset.key))
        let workItemid=event.currentTarget.dataset.key;
        processApprovals({workItemId:workItemid,status:'Reassign'});
    }
    
}