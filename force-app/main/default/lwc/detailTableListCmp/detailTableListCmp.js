import { LightningElement,track } from 'lwc';


const columns = [
    { label: 'Label', fieldName: 'name' },
    { label: 'Website', fieldName: 'website', type: 'url' },
    { label: 'Phone', fieldName: 'phone', type: 'phone' },
    { label: 'Balance', fieldName: 'amount', type: 'currency' },
    { label: 'CloseAt', fieldName: 'closeAt', type: 'date' },
];
export default class DetailTableListCmp extends LightningElement {


    @track data = [];
    @track columns = columns;
    @track rowOffset = 0;

    // eslint-disable-next-line @lwc/lwc/no-async-await
    async connectedCallback() {
        this.data =[{name:'raja',website:'dsds',Phone:122233,Balance:12340,CloseAt:'20/02/2020'}]
        
        // await fetchDataHelper({ amountOfRecords: 100 });
    }

    increaseRowOffset() {
        this.rowOffset += 100;
    }


}