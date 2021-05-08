import { LightningElement,track,wire } from 'lwc';
import { getPicklistValues } from 'lightning/uiObjectInfoApi';
import MEASURED_TYPE from '@salesforce/schema/Unit_System_Record__c.Measured_Type__c';
import UNITSYS_REC from '@salesforce/schema/Unit_System_Record__c';
import { getObjectInfo } from 'lightning/uiObjectInfoApi';

export default class Re_areaconversionCmp extends LightningElement {


    measuredunittype ="gajam";
    @track dimension;
   // @track dimensionsList =[];
    @track convertedmeasure;
    @track measuredunit =1;
    @track convertedtext;
    constructor(){
        super();
       
    }
    get areainputstr(){
        return "Enter Area in "+this.measuredunittype;
    }
    get dimensionsList(){
        return [{label:'Length',value:'Length'},
        {label:'Volume',value:'Volume'},
        {label:'Area',value:'Area'},
        {label:'Weight',value:'Weight'},
        {label:'Time',value:'Time'}]

    }
    get showLength(){
        return this.dimension === 'Length'
    }
    get showArea(){
        return this.dimension == 'Area'
    }
    get showVolume(){
        return this.dimension === 'Volume'
    }
    get showWeight(){
        return this.dimension === 'Weight'
    }
    get measuredunits() {
        return [
            {label:'Sq.inch',value:'Sq.inch'},
            { label: 'Sq.ft', value: 'Sq.ft' },
            { label: 'Sq.yards', value: 'Sq.yards' },
            { label: 'Sq.mile', value: 'Sq.mile' },
            { label: 'Sq.metre', value: 'Sq.metre' },
            { label: 'Sq.kilometer', value: 'Sq.kilometer' },
            { label: 'Hectare', value: 'Hectare' },
            { label: 'Acre', value: 'Acre' },
            
        ];
    }
    onChgDim(event){
        this.dimension =event.detail.value;
    }
    onChgUnitType(event){
        this.measuredunittype =event.detail.value;
        if(this.measuredunittype=='ft'){
            this.convertedtext = this.measuredunit+' ft is equal to '+ this.measuredunit *12 +' inches'
        }
        else if(this.measuredunittype=='gajam' || this.measuredunittype=='yard'){

            this.convertedtext = this.measuredunit+' yard/gajam is equal to '+(this.measuredunit * 9)+' sq.ft \n'
                                    +((this.measuredunit  *900) / 43560) +' cents';
        }
        else if(this.measuredunittype=='gunta'){

            this.convertedtext = this.measuredunit+' guntas is equal to '+(this.measuredunit * 1089)+' sq.ft'
                       + ' \n    '+this.measuredunit * 121 +'sq. yards /sq.gajam '
                       + ' \n    '+ (this.measuredunit *1089*100) /43560 +' cents';
        }
        else if(this.measuredunittype=='acre'){
            
            this.convertedtext = this.measuredunit+' acre is equal to '+(this.measuredunit * 43560)+' sq.ft'
                              + ' \n    '+(this.measuredunit * 43560) /9+' sq.yards or sq.gajam '
                              + ' \n    '+this.measuredunit * 100 +' cents';
        }
        else if(this.measuredunittype=='cent'){
            this.convertedunittype='ft'
            this.convertedmeasure=this.measuredunit * 435.60 ;
            this.convertedtext = this.measuredunit+' cents is equal to '+this.measuredunit * 435.60 +' sqft'
                              + ' \n  \t'+this.measuredunit * 48.4 +' sq.yards or sq.gajam ';
       
        }
    
    } 
    
    onConversion(event){
        this.measuredunit =event.detail.value;
        if(this.measuredunittype=='ft'){
            this.convertedmeasure=this.measuredunit *12;
            this.convertedtext = this.measuredunit+' ft is equal to '+ this.measuredunit *12 +' inches'
        }
        else if(this.measuredunittype=='gajam' || this.measuredunittype=='yard'){

            this.convertedmeasure= this.measuredunit * 9;
            this.convertedtext = this.measuredunit+' yard/gajam is equal to '+(this.measuredunit * 9)+' sq.ft \n'
                                    +(this.measuredunit *900  / 43560) +' cents';
        }
        else if(this.measuredunittype=='gunta'){

            this.convertedmeasure=this.measuredunit *1089;
            this.convertedtext = this.measuredunit+' guntas is equal to '+(this.measuredunit * 1089)+' sq.ft'
                       + ' \n    '+this.measuredunit * 121 +'sq. yards /sq.gajam '
                       + ' \n    '+ (this.measuredunit *1089*100) /43560 +' cents';
        }
        else if(this.measuredunittype=='acre'){
            
            this.convertedtext = this.measuredunit+' acre is equal to '+(this.measuredunit * 43560)+' sq.ft'
                              + ' \n    '+(this.measuredunit * 43560) /9+' sq.yards or sq.gajam '
                              + ' \n    '+this.measuredunit * 100 +' cents';
        }
        else if(this.measuredunittype=='cent'){
            this.convertedunittype='ft'
            this.convertedmeasure=this.measuredunit * 435.60 ;
            this.convertedtext = this.measuredunit+' cents is equal to '+this.measuredunit * 435.60 +' sqft'
                              + ' \n  \t'+this.measuredunit * 48.4 +' sq.yards or sq.gajam ';
       
        }
        else if(this.measuredunittype=='metre'){
            this.convertedunittype='metre'
            this.convertedmeasure=this.measuredunit * 3.28084 ;
            this.convertedtext = this.measuredunit+' metre is equal to '+this.measuredunit * 3.28 +' sq ft';
                             
       
        }
    }
}