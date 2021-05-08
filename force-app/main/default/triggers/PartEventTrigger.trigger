trigger PartEventTrigger on Part_Ready__e (after insert) {
    
        List<Case> cases = new List<Case>();
    
    // Get user Id for case owner. Replace username value with a valid value.
   // User adminUser = [SELECT Id FROM User WHERE Username='admin@acme.org'];
       
    // Iterate through each notification.
    for (Part_Ready__e event : Trigger.New) {
        System.debug('Printer model: ' + event.Part_Serial_Number__c);
        if (event.Part_Serial_Number__c == 'MN-123') {
            // Create Case to order new printer cartridge.
            Case cs = new Case();
            cs.Priority = 'Medium';
            cs.Subject = 'Order new ink cartridge for SN ' + event.Part_Serial_Number__c;
            // Optional: Set case owner ID so it is not Automated Process.
            // This step is not needed if the running user is overridden 
            // or if using assignment rules.
           // cs.OwnerId = adminUser.Id;
            cases.add(cs);
        }
    }
    
    // Insert all cases in the list.
    if (cases.size() > 0) {
        insert cases;
    }

}