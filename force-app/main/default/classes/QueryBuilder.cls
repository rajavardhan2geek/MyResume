public  class QueryBuilder {

    public String queryType;
    public String query{get;set;}
    public QueryBuilder(){
        this.queryType='SOQL';
    }
    public QueryBuilder(String qType){
        this.queryType=qType;
    }
    public void addQueryType(){

        if(queryType.equalsIgnoreCase('SOQL')){
            this.query='SELECT ';
        }
        else if(queryType.equalsIgnoreCase('SOSL')){
            this.query='FIND ';
        }

    }
    /**
     * Where Clause
     */
  public void addClause(List<Criteria> criteriaList){

    if(queryType.equalsIgnoreCase('SOQL')){

        this.query+= ' WHERE ';
    }

  }
  /**
   * fields 
   */
  public void addFields(SObjectModel objmodel){

    if(queryType.equalsIgnoreCase('SOQL')){

        if(objmodel.selectFieldList!= null){
        this.query+= String.join(objmodel.selectFieldList, ',');
    
         }


    }

  }


  public void addObjecttoQuery(SObjectModel objmodel){
        if(queryType.equalsIgnoreCase('SOQL')){
            this.query+= ' FROM '+objmodel.objType.getDescribe().getName();
        }
  }

}