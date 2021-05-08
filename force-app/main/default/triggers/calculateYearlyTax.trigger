trigger calculateYearlyTax on monthly_income__c (after insert ,after update ,after delete) {

    if(Trigger.isAfter)
    {
        
        IncomeTaxCalculator.afterUpdate(Trigger.new);
        
	}
}