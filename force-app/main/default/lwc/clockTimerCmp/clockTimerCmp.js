import { LightningElement,track } from 'lwc';


export default class ClockTimerCmp extends LightningElement {


    @track lockdownstart;
    @track todaydate;
    @track lockdownlastdate;
    @track remainingdays;
    @track remainingMinutes;
    @track remainingSeconds;
    @track remainingMilisec;
    lockdownindays = 14;
    noofdays=0;
   
    constructor(){
        super();
        
        this.lockdownstart =new Date('2020-05-13 00:00:00.000');
        this.todaydate = new Date();;
      this.lockdownlastdate = new Date();
        this.lockdownlastdate.setDate(this.lockdownstart.getDate()+ this.lockdownindays);
     
        //this.lockdownlastdate = this.lockdownlastdate.setTime('000')
        this.noofdays = Math.floor((this.lockdownlastdate - this.lockdownstart)/new Date(86400000),1);
        console.log(this.noofdays+' lockdown last date '+this.lockdownlastdate);
        this.remainingdays = Math.ceil((this.lockdownlastdate - this.todaydate)/new Date(86400000));
        console.log(this.remainingdays);
        this.remainingHours=Math.ceil((this.lockdownlastdate - this.todaydate)/ (1000 * 60 * 60));
        this.remainingMinutes=Math.floor((this.lockdownlastdate - this.todaydate) / (1000 * 60 ) );
        this.remainingSeconds= (this.lockdownlastdate - this.todaydate)/ 1000
        this.remainingMilisec= this.lockdownlastdate - this.todaydate;
        console.log( this.lockdownlastdate);
    }

    changeTime(event){
        this.todaydate = new Date();
        this.remainingdays = Math.ceil((this.lockdownlastdate - this.todaydate)/new Date(86400000));
        this.remainingHours=Math.ceil((this.lockdownlastdate - this.todaydate)/ (1000 * 60 * 60));
        this.remainingMinutes=Math.floor((this.lockdownlastdate - this.todaydate) / (1000 * 60 ) );
        this.remainingSeconds= (this.lockdownlastdate - this.todaydate)/ 1000
        this.remainingMilisec= this.lockdownlastdate - this.todaydate;
       
    }
    get currentHours(){
        return this.todaydate.getHours();
    }
    get currentMinutes()
    {
        return this.todaydate.getMinutes();
    }
    get currentSeconds(){
        return this.todaydate.getSeconds();
    }
    
    get currentMiliseconds()
    {
        return this.todaydate.getMilliseconds();
    }
   
  
   
  
   
   
}