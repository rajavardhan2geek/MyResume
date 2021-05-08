import { LightningElement,api } from 'lwc';

export default class TimeCounterDisplay extends LightningElement {

    @api remainingdays;
    @api remainingHours;
    @api remainingMinutes;
    @api remainingSeconds;
    @api remainingMilisec;

}