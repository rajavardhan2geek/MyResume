public  class Criteria {

    public String fieldName{get;set;}
    public Object fieldValue{get;set;}
    public String operationType{get;set;}
    public String conditionexpr{get;set;}
 
    /**
     * 
     * @param fieldName  Object field Api Name
     * @param fieldValue Object field Value 
     *   
     */
    public Criteria(String fieldName,Object fieldValue,String operationType){
        this.fieldName=fieldName;
        this.fieldValue=fieldValue;
        this.operationType=operationType;
        

    }
    /**
     * 
     * @param fieldName 
     * @param fieldValue 
     * @param operationType 
     * @param condition 
     */
    public Criteria(String fieldName,Object fieldValue,String operationType,String condition){
        this.fieldName=fieldName;
        this.fieldValue=fieldValue;
        this.operationType=operationType;
        this.conditionexpr='OR';   

    }

    public String getCriteriaStr(){
    
       
        if(this.fieldValue instanceof String){
            String searchStr = '(\'' + String.escapeSingleQuotes(String.valueOf(this.fieldValue))+'\')';
            return this.fieldName+' '+this.operationType+' '+searchStr;
          }
          if(this.fieldValue instanceof Id){
            String searchStr = '\'(' + String.escapeSingleQuotes(String.valueOf(this.fieldValue))+')\'';
            return this.fieldName+' '+this.operationType+' '+searchStr;
          }
        else{
            return this.fieldName+'  '+this.operationType+' '+this.fieldValue;
        }
        
    }
 
}