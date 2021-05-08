import { LightningElement } from 'lwc';
import getEncryptMessage from '@salesforce/apex/SecretMessage.getEncryptMessage'
import getDecryptMessage from '@salesforce/apex/SecretMessage.getDecryptMessage'
export default class NetworkSecurity extends LightningElement {

    clearText='HelloRaja  ';
    cipherText;

    connectedCallback(){

        this.encryptData();
    }
    handleClearText(event){

        if(event.target.value.length>6){
            this.clearText=event.target.value;
        }
    }
    handleCipherText(event){

        if(event.target.value.length>6){
            this.cipherText=event.target.value;
        }
    }
    encryptData(){

        getEncryptMessage({clearText:this.clearText})
         .then(data=>this.cipherText=data)

    }
    decryptData(){

        getDecryptMessage({ciphertext:this.cipherText})
         .then(data=>this.clearText=data)

    }

}