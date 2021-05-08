import { LightningElement,wire ,track} from 'lwc';
import { NavigationMixin } from 'lightning/navigation';
import getRowActions from '@salesforce/apex/ExpenseController.getRowActions';
import getDailyExpenses from '@salesforce/apex/ExpenseController.getDailyExpenses';
export default class ExpenseList extends NavigationMixin(LightningElement) {

    actions=[];
    columns = [];
    dailyExpenses=[];
    @wire(getRowActions) actionsList(value){
        if(value.data){
            console.log('sdsd'+JSON.stringify(value.data));
            var rwactions=[];
            value.data.forEach(function(item){
                rwactions.push({
                'label':item.label__c,
                'name':item.Name});
            });
            this.actions=rwactions;
            console.log('sdsd'+JSON.stringify(rwactions));
        }

    }
    @wire(getDailyExpenses,{'month':'AUG'}) getDailyExpensesList(value){
       if(value.data){
          
        this.dailyExpenses=value.data.dailyExpenses;
        var col=[];
        value.data.dtcols.forEach(function(item){
            col.push(item);
        });
        col.push.apply(col,this.columns);
        col.push({
            type: 'action',
            typeAttributes: { rowActions: this.actions }
        });
        this.columns=col;
        console.log('sdsd'+JSON.stringify(this.columns));
      
       }
       
    }

    constructor(){
        super();
    }
    handleRowAction(event){
        const actionName = event.detail.action.name;
      
        const row = event.detail.row;
        console.log('sdsd'+row)
        switch (actionName) {
            case 'delete':
                this.deleteRow(row);
                break;
            case 'edit':
                this.editRowDetails(row);
                break;
            case 'view':
                    this.showRowDetails(row);
                    break;
            case 'new':
                    this.newRowDetails(row);
                    break;
            default:

        }
    }
    newRowDetails(row){
        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                recordId: row.Id,
                objectApiName: 'Daily_Expenses__c', // objectApiName is optional
                actionName: 'new'
            }})
    }
    showRowDetails(row){ 
        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                recordId: row.Id,
                objectApiName: 'Daily_Expenses__c', // objectApiName is optional
                actionName: 'view'
            }
        });

    }
    editRowDetails(row){
        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                recordId: row.Id,
                objectApiName: 'Daily_Expenses__c', // objectApiName is optional
                actionName: 'edit'
            }
        });
    }
    deleteRow(row){

    }
}