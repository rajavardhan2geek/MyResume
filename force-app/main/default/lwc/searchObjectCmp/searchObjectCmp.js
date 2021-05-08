import { LightningElement,track,wire } from 'lwc';
import  getSObjectList from '@salesforce/apex/SearchObjectController.getSObjectList';
import getAllFields from '@salesforce/apex/SearchObjectController.getAllFields';
export default class SearchObjectCmp extends LightningElement {


    @track sobjectsapiname;
    @track sobjects;
    @wire(getSObjectList) objectslist({error,data}){
        if(data){
            this.sobjects= data;
            console.log('data  '+JSON.stringify(data));
        }   
    }
    
    constructor(){
        super();
      
        
    }
   
    @track searchObject='';
    @wire(getAllFields,{objectName:'$searchObject'}) fieldlist;
    handleChange(event){

        this.searchObject =event.detail.value;
        
        console.log('changed value'+event.detail.value);
       

    }



}