({
	compATab : function(component, event, helper) {
		var tab1 = component.find('compA');
		var tab1data = component.find('compATab');
		
		
		var tab2 = component.find('compB');
		var tab2data = component.find('compBTab');
		
		
		var tab3 = component.find('compC');
		var tab3data = component.find('compCTab');
		
		
		$A.util.addClass(tab1data,'slds-active');
		$A.util.addClass(tab1,'slds-show');
		$A.util.removeClass(tab1,'slds-hide');
		
		$A.util.removeClass(tab2data,'slds-active');
		$A.util.addClass(tab2,'slds-hide');
		$A.util.removeClass(tab2,'slds-show');
		
		$A.util.removeClass(tab3data,'slds-active');
		$A.util.removeClass(tab3,'slds-show');
		$A.util.addClass(tab3,'slds-hide');
		
	},
compBTab :	function(component, event, helper) {
		var tab1 = component.find('compA');
		var tab1data = component.find('compATab');
		
		
		var tab2 = component.find('compB');
		var tab2data = component.find('compBTab');
		
		
		var tab3 = component.find('compC');
		var tab3data = component.find('compCTab');
		
		
		$A.util.addClass(tab1,'slds-hide');
		$A.util.removeClass(tab1,'slds-show');
		$A.util.removeClass(tab1data,'slds-active');
		
		$A.util.removeClass(tab2data,'slds-active');
		$A.util.addClass(tab2,'slds-show');
		$A.util.removeClass(tab2,'slds-hide');
		
		$A.util.removeClass(tab3data,'slds-active');
		$A.util.removeClass(tab3,'slds-show');
		$A.util.addClass(tab3,'slds-hide');
		
	},
	compCTab :	function(component, event, helper) {
		var tab1 = component.find('compA');
		var tab1data = component.find('compATab');
		
		
		var tab2 = component.find('compB');
		var tab2data = component.find('compBTab');
		
		
		var tab3 = component.find('compC');
		var tab3data = component.find('compCTab');
		
		
		$A.util.removeClass(tab1data,'slds-active');
		$A.util.removeClass(tab1,'slds-show');
		$A.util.addClass(tab1,'slds-hide');
		
		$A.util.removeClass(tab2data,'slds-active');
		$A.util.addClass(tab2,'slds-hide');
		$A.util.removeClass(tab2,'slds-show');
		
		$A.util.addClass(tab3data,'slds-active');
		$A.util.removeClass(tab3,'slds-show');
		$A.util.removeClass(tab3,'slds-hide');
		
	},
})