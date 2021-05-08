<aura:application extends="force:slds">

<div class="slds-tabs_default" style="border:solid 2px" >
      <ul class="slds-tabs_default__nav" role="tablist">
    <li aura:id="compATab" class="slds-tabs_default__item " title="Item One" role="presentation">
      <a class="slds-tabs_default__link" href="javascript:void(0);" onclick='{!c.compATab}' role="tab" tabindex="0" aria-selected="true" aria-controls="tab-default-1" id="tab-default-1__item">Item One</a>
    </li>
    <li  aura:id="compBTab" class="slds-tabs_default__item" title="Item Two" role="presentation">
      <a class="slds-tabs_default__link" href="javascript:void(0);" onclick='{!c.compBTab}' role="tab" tabindex="-1" aria-selected="false" aria-controls="tab-default-2" id="tab-default-2__item">Item Two</a>
    </li>
    <li aura:id="compCTab"  class="slds-tabs_default__item" title="Item Three" role="presentation">
      <a class="slds-tabs_default__link" href="javascript:void(0);" onclick="{!c.compCTab}" role="tab" tabindex="-1" aria-selected="false" aria-controls="tab-default-3" id="tab-default-3__item">Item Three</a>
    </li>
  </ul>
    <div aura:id="compA" class="slds-tabs_default__content slds-hide" role="tabpanel" aria-labelledby="tab-default-1__item"><c:ComponentA /></div>
  <div aura:id="compB" class="slds-tabs_default__content slds-show" role="tabpanel" aria-labelledby="tab-default-2__item"><c:ComponentD /></div>
  <div aura:id="compC" class="slds-tabs_default__content slds-hide" role="tabpanel" aria-labelledby="tab-default-3__item">Item Three Content</div>
    </div>
</aura:application>