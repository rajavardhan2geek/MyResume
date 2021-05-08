/*
 * 
 *
 * Deduct SD
 * Deduct 1st slab with no tax 
 * Deduct from corresponding slabs lower limit and multiply with tax percent then add with tax constant 
 * 
 * 
 * 
 
*/


public class IncomeTaxCalculator {

    
    public static void afterUpdate(List<monthly_income__c> newValues){
	 
        System.debug(newValues.get(0).taxable_income__c);
               
        List<AggregateResult> yearlyrollup =[select  sum(taxable_income__c) total,year__c from monthly_income__c where  CALENDAR_YEAR(paydate__c) =2019  group by year__c];
        System.debug(yearlyrollup.get(0).get('total'));
         System.debug(yearlyrollup.get(0).get('year__c') +'year record');
        
         Id yearrecord =(Id)yearlyrollup.get(0).get('year__c');
         List<yearly_income__c> yearlyincomes =[select year__c,taxable_income__c,income_tax__c from  yearly_income__c where Id =:yearrecord];

        
        
      //  List<IT_Slabs__mdt> itslabList=[select Id,citizen_type__c ,lower_limit_taxable_income__c,net_taxable_income__c,upper_limit__c,tax_constant__c,tax_percent__c from IT_Slabs__mdt];
        Map<String,IT_Slabs__mdt> itslabMap = new Map<String,IT_Slabs__mdt>([select Id,citizen_type__c ,net_taxable_income__c ,lower_limit_taxable_income__c,upper_limit__c,tax_constant__c,tax_percent__c from IT_Slabs__mdt]);
        System.debug(itslabMap.keySet());
        Double taxableamount =(Double)(yearlyrollup.get(0).get('total'));
      /*  for(IT_Slabs__mdt itslabmdt:itslabMap.values()){
        
            if(itslabmdt.tax_percent__c ==0){
                taxableamount = (taxableamount - itslabmdt.net_taxable_income__c)-50000;
                
            }
            
            
        }*/
        Double taxamount =0;
          for(IT_Slabs__mdt itslabmdt:itslabMap.values()){
        
              if(itslabmdt.lower_limit_taxable_income__c <= taxableamount && taxableamount <=itslabmdt.upper_limit__c){
				
					taxamount =   (taxableamount -   itslabmdt.lower_limit_taxable_income__c)  * (itslabmdt.tax_percent__c/100) ;
                  	taxamount =taxamount+itslabmdt.tax_constant__c;
                  yearlyincomes.get(0).income_tax__c =taxamount;
              }
            
            
        }
        update yearlyincomes;
        System.debug('update in yearly taxes'+taxamount);
        
        
    }
}