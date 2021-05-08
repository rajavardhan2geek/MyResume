public  class CriteriaStackBuilder {

    public List<Criteria> criteriaList;
    public String expression{get;set;}
    Integer topEle;
    public void pushItem(Criteria criteria){
            if(criteriaList !=null){
                criteriaList.add(criteria);

            }
            else{
                criteriaList = new List<Criteria>();
                criteriaList.add(criteria);
            }
    }
    public Criteria popItem(){
        
        if(criteriaList.size()>1){
            topEle=criteriaList.size();
            return criteriaList[topEle];
        }
        else {
            return criteriaList[0];
        }

    }

}