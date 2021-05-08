import { LightningElement ,track,api} from 'lwc';
 
export default class paginationLwcDemo extends LightningElement {

    @track page;
    @track pglimit;
    @track totrows;
    @api set pagelimit(value){
      this.pglimit = value;
    }

    get pagelimit(){
      return this.pglimit;
    }
    @api set totalrows(value){

      this.totrows =value;
      this.pagebuttonlist =[];
      var i;
  
      this.pagebuttons =Math.ceil(parseInt(value,10)/parseInt(this.pagelimit,10));
      console.log('page button '+this.pagebuttons);
      for(i=1;i<=this.pagebuttons;i++)
      {
        this.pagebuttonlist.push(i);
    
      }

       
    }
    get totalrows(){

      return this.totrows;
    }
    @track pagebuttonlist;

constructor()
{
  super();
  this.page=1;
  this.pagebuttons = parseInt(this.totalrows)/parseInt(this.pagelimit);
  console.log(this.pagebuttons);
}

previousHandler()
{
  var pagechangeevent;
   if(this.page >1)
   {
     this.page--;
      pagechangeevent = new CustomEvent('pagechange',{detail:this.page});
      this.dispatchEvent(pagechangeevent);
   }
  
  return  this.page;
}
nextHandler()
{
  var pagechangeevent;
  this.page++;
   pagechangeevent = new CustomEvent('pagechange',{detail:this.page});
  this.dispatchEvent(pagechangeevent);
  return this.page;
}


}