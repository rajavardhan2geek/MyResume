public class AccAnt
{

    private Cache.Org.expenseConverterCache expenseCache  =Cache.Org.get('local.partition.expenseConverterCache');
    AccAnt(){
    
        System.debug(Cache.Org.getPartition('local.partition.expenseConverterCache'));
    }
}