import { LightningElement ,api,wire} from 'lwc';
import { CurrentPageReference, NavigationMixin } from 'lightning/navigation';
import sendRequest from '@salesforce/apex/CurlRequestClass.sendRequestMethod';
export default class CurlURLCmp extends NavigationMixin(LightningElement) {

     reqtype;
     endpoint;
     response;
     username;
     password;
     consumerId;
     consumersecret;
     redirecturi;
     urlStateParameters=null
     authorizationHeader={};
    connectedCallback()
    {

        
        this.reqtype='GET';

    }
    @wire(CurrentPageReference)  getStateParameters(currentPageReference) {
        if (currentPageReference) {
            console.log('code'+JSON.stringify(currentPageReference));
       //     if(currentPageReference.state!=undefined)
        //     console.log('code'+decodeURI(currentPageReference.state.fragment));
            //  this.urlStateParameters = currentPageReference.state;
          // this.setParametersBasedOnUrl();
        }
    }
    setParametersBasedOnUrl() {
        this.urlId = this.urlStateParameters.id || null;
         }
    get requests(){

      return  [ { label: 'GET', value: 'GET' },
        { label: 'POST', value: 'POST' },
        { label: 'PUT', value: 'PUT' },
        { label: 'DELETE', value: 'DELETE' }];
    }
    handleChange(event){
        this.reqtype=event.target.value;
    }
    handleChgUrl(event){
        this.endpoint=event.target.value;
    }
    handlechgUsername(event){
        this.username=event.target.value;
    }
    handlechgpassword(event){
        this.password=event.target.value;
    }
    handlechgKey(event){
        this.consumersecret=event.target.value;
    }
    handlechgConsumerId(event){
        this.consumerId=event.target.value;
    }
    handleChgUrlRedirect(event){
        this.redirecturi=event.target.value;
    }
    sendRequest(event)
    {
        this.authorizationHeader={
            'endpoint':this.endpoint,
            'method':this.reqtype,
            'username':this.username,
            'password':this.password,
            'consumerKey':this.consumerId,
            'consumerSecret':this.consumersecret

        }
        sendRequest({authorizationHeader:this.authorizationHeader})
        .then(data=>{
        console.log(JSON.stringify(data));this.response='Connected to Org'+data});
        

    }
    useragentflow(event){
        let  responsetype='code';
        let queryparams='?client_id='+this.consumerId+'&redirect_uri='+this.redirecturi+
        '&response_type=token&state=state'
       let  webpage = {
            type: 'standard__webPage',
            attributes: {
                url: this.endpoint+queryparams
                
            },
           
         
        };
       
        this[NavigationMixin.GenerateUrl](webpage)
            .then(url => this.url = url);


        this[NavigationMixin.Navigate](webpage);
        
    }
    WebServerflow(event){
        let  responsetype='code';
        let queryparams='?client_id='+this.consumerId+'&redirect_uri='+this.redirecturi+
        '&response_type=code&state=state'
       let  webpage = {
            type: 'standard__webPage',
            attributes: {
                url: this.endpoint+queryparams
                
            },
           
         
        };
       
        this[NavigationMixin.GenerateUrl](webpage)
            .then(url => this.url = url);


        this[NavigationMixin.Navigate](webpage);
        
    }

}