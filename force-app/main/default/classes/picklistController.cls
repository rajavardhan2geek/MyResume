public class picklistController {
    public String country{get; set;}
    public String state{get; set;}
    public List<SelectOption> countrylist
    {
        get
        {
            countrylist= new  List<SelectOption>();
            countrylist.add(new SelectOption('India','India'));
            countrylist.add(new SelectOption('USA','USA'));
            countrylist.add(new SelectOption('U.K','U.K'));
            return countrylist;
        }
     set;
    }
    public void updateDropdown() {
       System.debug('gfg');
    }
    public List<SelectOption> states{
        get{
             states= new  List<SelectOption>();
             states.add(new SelectOption('AP','AP'));
             states.add(new SelectOption('TS','TS'));
			states.add(new SelectOption('KA','KA'));
            states.add(new SelectOption('TN','TN'));
            return states;
         }
        set;
    }
}