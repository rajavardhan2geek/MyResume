/*

Created By 
select Id From acc
select Id,(select id ,Name From Acco.contacts) from Account where orderbt
select Id,(select id ,Name From Acco.contacts) from Account where groupby
select Id from Account where orderby
select Id from Account where groupby
select Id from Account where Id in  (select id From con) and Name in (select name from ) ;
    
    */
  

public class SOQLBuilder {

  public SObjectModel sobjmodel{get;set;}
  public List<Criteria> criteriaList{get;set;}
  public String soqlQuery{get;set;}

  public SOQLBuilder(SObjectModel sobjmodel){
    this.sobjmodel = sobjmodel;
    
}



  /**
   * build SOQL Criteria in where clause
   **/
  public void buildSOQLCriteria(){
      if(this.criteriaList != null){
        if(this.criteriaList.size()>0){
        this.soqlQuery += ' WHERE ('+this.criteriaList.get(0).getCriteriaStr();
        for(Integer i=1;i<this.criteriaList.size();i++){
           if(this.criteriaList.get(i).conditionexpr == null){
           this.soqlQuery +=  ' AND '+this.criteriaList.get(i).getCriteriaStr()+' )';}
           else{
            this.soqlQuery +=  ' OR '+this.criteriaList.get(i).getCriteriaStr()+' )';
           }
        }
      }
    }
  }
 
  public void addorderByClause(String fieldname,String sortingtype)
  {
  if(sortingtype.equalsignorecase('desc')){
    this.soqlQuery += ' ORDER BY '+fieldname+ ' desc';}
    else{
      this.soqlQuery += ' ORDER BY '+fieldname+ ' ASC';}
  }
  public void aggregateQueries(String grpFieldName)
  {
  
  }
  public SOQLBuilder getSOQLQuery()
  {
  
    this.soqlQuery ='SELECT ';
    this.soqlQuery+= String.join(this.sobjmodel.getFieldNames(),',');
    this.soqlQuery+=' FROM '+this.sobjmodel.objectapiname;
    return this;
  }
  public void clonesoql(SOQLBuilder previousObject)
  {

    this.soqlQuery = previousObject.soqlQuery;
    
  }
}