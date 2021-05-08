<aura:application extends="force:slds" controller='QuestionController'>
    <aura:handler name='sampleComponentEvent' event='c:SampleEventProp' action="{!c.handleformresp}"/>
    <aura:attribute name='FormResponses' type='FormResponse__c[]'/>
    <aura:attribute name='msg' type='String'/>
   <aura:attribute name='formresparr' type='FormResponse__c' default="{Response__c:'',Question__c:''}"/>
    <aura:handler event='c:Applicationevnt' phase='bubble' action='{!c.navigateToView}'/>
    <div class="slds-scope"><h1>Registration Page</h1>
          </div>
      <div class='slds-grid'> 
          	 
         	 <div class="slds-col slds-size--1-of-6" > <c:HomeComponent /></div>
          
          <div class='slds-col slds-size--4-of-6 postion:center'  aura:id="displayPort">    </div>
             {!v.body}
          <div class="slds-col slds-size--1-of-6" >
          {!v.msg}
          
          
          
          
          </div>
    </div>
    
    
    <!-- footer-->
    <footer role="contentinfo" class="slds-p-around--large">
<!-- footer-->
  <div class="slds-grid slds-grid--align-spread">
    <p class="slds-col">Salesforce Lightning Design System Example</p>
    <p class="slds-col">&copy; Rajavardhan</p>
	
  </div>
    </footer>
       
</aura:application>