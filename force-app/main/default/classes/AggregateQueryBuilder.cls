public  class AggregateQueryBuilder implements Callable {


    String soqlQuery;

    String cntAggregateFunc(String strFieldName){
            return ' SELECT COUNT('+strFieldName+')'; 

    }   
    String sumAggegrateFunc(String strFieldName){

        return ' SELECT SUM('+strFieldName+')';

    }
    String maxAggregateFunc(String strFieldName){

        return 'SELECT MAX('+strFieldName+')';

    }
    String minAggregateFunc(String strFieldName){

        return 'SELECT SUM('+strFieldName+')';

    }
    public String call(String action, Map<String, Object> args) {
        switch on action {
          when 'count' {
            return this.cntAggregateFunc((String)args.get('stringValue'));
          }
          when 'sum'{
            return this.sumAggegrateFunc((String)args.get('decimalValue'));
          }
          when 'max'{
            return this.maxAggregateFunc((String)args.get('decimalValue'));
          }
          when 'min'{
            return this.minAggregateFunc((String)args.get('decimalValue'));
          }
         
          when else {
           throw new ExtensionMalformedCallException('Method not implemented');
          }
        }
    }
    public class ExtensionMalformedCallException extends Exception{}
}