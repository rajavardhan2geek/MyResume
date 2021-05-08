global  class QuoteApprovalEmailInboundService implements Messaging.InboundEmailHandler{

    
    global Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email ,Messaging.InboundEnvelope env )
    {
        Messaging.InboundEmailResult result = new Messaging.InboundEmailResult();
        System.debug('email'+email.fromName+' to name'+email.toAddresses+' envelope'+ env.fromAddress);
        result.success=true;
        return result;
    }
}