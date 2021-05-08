public class QueuableApex implements Queueable {

    public static void execute(QueueableContext context){
        System.debug('welcome'+Limits.getLimitQueries()+'fd'+context.getJobId());
    }
}