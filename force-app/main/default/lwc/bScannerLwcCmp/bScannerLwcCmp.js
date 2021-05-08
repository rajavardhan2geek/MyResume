import { LightningElement } from 'lwc';
import Quagga from '@salesforce/resourceUrl/Quagga';
import {  loadScript } from 'lightning/platformResourceLoader';


export default class BScannerLwcCmp extends LightningElement {

    renderedCallback(){

        loadScript(this,Quagga)
        .then(
            ()=>{console.log('scripts loaded')})

    }
    handleFilesChange(evnt)
    {
        console.log(evnt.detail.files[0]);
        if (window.File && window.FileReader && window.FileList && window.Blob) {
             console.log('File Api Supported');
             var reader = new FileReader();
             this.template.querySelector('img').src =window.URL.createObjectURL(evnt.detail.files[0]);
             this.template.querySelector('img').width =100;
             this.template.querySelector('img').height =100;
             reader.readAsDataURL(evnt.detail.files[0]);
            console.log();
        }
        else
        console.log('File Api Not Supported');
    }
    
}