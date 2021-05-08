import { LightningElement,api } from 'lwc';
import getContacts from '@salesforce/apex/UnlimitedPaginationController.getContacts'
export default class RecordPaginationCmp extends LightningElement {

    @api recordsPerPage =5;
     count=0;
     recordList=[];
     rows=0;
     selectedrecordsList=[];
      
     connectedCallback(){
        this.getRecords();
     }

     getRecords(){
        getContacts({prevAccRef:null,nextAccRef:null,recordLimit:this.recordsPerPage})
        .then(data=>{
            if(data){
                this.formatRecords(data)
            }

        });
     }
     handleEmailChg(event){
        console.log(event.target.value);
        let element = this.recordList.find(ele=>ele.Id ==event.currentTarget.dataset.value);
        let selectedelement = this.selectedrecordsList.find(ele=>ele.Id ==event.currentTarget.dataset.value);
        if(!element.selected ){
            element.selected=true;
            console.log(event.target.value);
            element.Email=event.target.value
           
            console.log('dsds'+element.Email);
            //this.recordList.push(element);
            this.selectedrecordsList.push(element);
        }
        else{

        }
     }
    onselected(event){

      let element = this.recordList.find(ele=>ele.Id ==event.currentTarget.dataset.value);
      let selectedelement = this.selectedrecordsList.find(ele=>ele.Id ==event.currentTarget.dataset.value);

      
      if(event.target.checked && !element.selected){
            element.selected=true;
            //this.recordList.push(element);
            this.selectedrecordsList.push(element);
      }
      else if(!event.target.checked && element.selected){
         element.selected=false;
         for(var i=0;i<this.selectedrecordsList.length;i++){
            if(element.Id==selectedelement.Id){
                this.selectedrecordsList.splice(i);
            }

         }
      //  this.selectedrecordsList.splice(element); 
      }
      console.log('  '+JSON.stringify(this.selectedrecordsList)); 

    } 
   formatRecords(data){
     this.recordList=[];
      if(data){
      //  console.log(JSON.stringify(data))
          data.forEach(item => {
             // console.log(JSON.stringify(item))
              this.recordList.push({
                  'Id':item.Id,
                  'selected':false,
                  'Name':item.Name,
                  'Email':item.Email,
                  'AccountName':item.Account !== undefined?item.Account.Name:null,
                  'CreatedDate':item.CreatedDate
              })
          });
          console.log('length  '+JSON.stringify(this.selectedrecordsList.length)); 
          if(this.selectedrecordsList.length>0){
            
            this.recordList.forEach(item=>{
                console.log('dsasa'+item.Id);
                var element=this.selectedrecordsList.find(ele=>ele.Id===item.Id);
                    console.log('element selected'+element);
                if(element!==undefined){
                 console.log('element selected'+element);
                item.selected=element.selected;
                item.Email=element.Email
            }
            
                   
               

            });   

        }
        this.recordList=[...this.recordList];


         // console.log(JSON.stringify(  this.recordList))
      }

   } 
   handlePrevious(event){
    this.count-=1;
    this.rows =  this.count>=0?(this.count*this.recordsPerPage):0;
    console.log(this.rows);
    getContacts({prevAccRef:this.rows,nextAccRef:null,recordLimit:this.recordsPerPage})
    .then(data=>{
        if(data){
            console.log('ds');
            this.formatRecords(data)
        }

    });
   } 
   get isDisabled(){
     if(this.count<=0){
         return true;
     }
     return false;
   }
   handleNext(event){
    
     this.count=this.count+1;
     this.rows = (this.count*this.recordsPerPage);
     console.log(this.rows);
    getContacts({prevAccRef:null,nextAccRef:this.rows,recordLimit:this.recordsPerPage})
    .then(data=>{
        if(data){
            this.formatRecords(data)
        }

    });
   }
}