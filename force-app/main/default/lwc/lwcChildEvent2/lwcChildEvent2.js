import { LightningElement } from 'lwc';
import { registerListener, unregisterAllListeners } from 'c/pubsub';
export default class LwcChildEvent2 extends LightningElement {

    connectedCallback() {
        // subscribe to inputChangeEvent event
        registerListener('inputChangeEvent', this.handleChange, this);
      }
      handleChange(event)
      {
          console.log(' pubsub event handled '+event)
      }
      disconnectedCallback() {
        // unsubscribe from inputChangeEvent event
        unregisterAllListeners(this);
      }
}