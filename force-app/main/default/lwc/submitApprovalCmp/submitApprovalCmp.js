import { LightningElement } from 'lwc';
import  getProcessInstances from '@salesforce/apex/ApprovalRequestBO.getProcessInstanceList';

import { NavigationMixin } from 'lightning/navigation';
const columns = [
  
    {label: 'Name', fieldName: 'Name', type: 'text'},
    {label: 'SObjectName', fieldName: 'SObjectName', type: 'text'},
    {label: 'targetRecordName', fieldName: 'targetRecordName', type: 'text'},
    {label: 'status', fieldName: 'status', type: 'text'}
];

export default class SubmitApprovalCmp extends NavigationMixin(LightningElement) {
    columns=columns;
    processInstances=[];
    connectedCallback(){
        this.getAllInstances();
    }
    getAllInstances(){
        getProcessInstances().then(
            data=>{
                if(data){
                    var procList=[];
                    data.forEach(item=>{
                    
                        procList.push({
                            "Id":item.Id,
                            "Name":item.ProcessDefinition.Name,
                            "SObjectName":item.ProcessDefinition.TableEnumOrId,
                            "status":item.Status,
                            "targetRecordId":item.TargetObject.Id,
                            "targetRecordName":item.TargetObject.Name

                        })


                    })
                    this.processInstances=procList;
                }
            })
            console.log( this.processInstances); 

    }

    formatData(data){

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
}