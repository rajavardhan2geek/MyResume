/**
 * @author rajavardhan
 * @email [example@gmail.com]
 * @create date 2020-09-07 18:49:45
 * @modify date 2020-09-07 18:49:45
 * @desc [description]
 */


public interface ITriggerHandler1 {

    void beforeInsert(TriggerParameters tp);
    void afterInsert(TriggerParameters tp);
    void beforeUpdate(TriggerParameters tp);
    void afterUpdate(TriggerParameters tp);

    void beforeDelete(TriggerParameters tp);
    void afterDelete(TriggerParameters tp);

    void afterUnDelete(TriggerParameters tp);
    Boolean isDisabled();

}