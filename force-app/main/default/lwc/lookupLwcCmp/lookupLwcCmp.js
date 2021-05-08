import { LightningElement ,wire,track,api} from 'lwc';
import doSearch from  '@salesforce/apex/LookupCntrllr.doSearch';
const DELAY =1;
export default class LookupLwcCmp extends LightningElement {

@track searchValue;
@api objectName; 
@api fields;

constructor(){
    super();
   // this.objectName ='Product2';
    //this.fields =['Id','Name']
}
handleSearch(evnt){

    var searchstr =evnt.target.value;
    const searchKey =searchstr.trim();
    if(searchKey.length >= 4)
    {
        console.log('searchKey'+searchKey.length);
        this.searchValue =  searchKey; 
        doSearch({objName: 'Product2',fields:'[Id,Name,ProductCode]',searchValue: this.searchValue})
            .then(result =>{this.products=result;});
    }
   else if(searchKey.length <= 3 )
        { 
            console.log('clear');
         this.products = null
        }
    
   
   
}
selectedProduct='';
selectProduct(event){

    //this.template.querySelector('li').getAttribute('data-value')
    this.selectedProduct =event.target.dataset.item;
    this.searchValue =this.selectedProduct;
    console.log(' '+this.selectedProduct);
}
handleLoad(){
    doSearch({objName: 'Product2',fields:'[Id,Name]',searchValue: this.searchValue})
        .then(result =>{
            this.products =result;
        })
        .catch(error=>{
            console.log(error)
        });
}

@track products;
@wire (doSearch, { objName: '$objectName',fields:'$fields',searchValue: '$searchValue' }) wiredproducts({error,data}){

    if(data)
    {
      this.products = data;  
    }
    else if(error)
    {
        console.log(' error '+error);
    }
}


}