/**
 * @author rajavardhan
 * @email [example@gmail.com]
 * @create date 2020-09-07 18:49:45
 * @modify date 2020-09-07 18:49:45
 * @desc [description]
 */


public interface ITriggerHandler {

    void beforeInsert(List<sObject> newList);
    void afterInsert(List<sObject> newList, Map<Id, sObject> newMap);
    void beforeUpdate(List<sObject> newList, Map<Id, sObject> newMap,  List<sObject> oldList, Map<Id, sObject> oldMap);
    void afterUpdate(List<sObject> newList, Map<Id, sObject> newMap,  List<sObject> oldList, Map<Id, sObject> oldMap);

    void beforeDelete(List<sObject> oldList , Map<Id, sObject> oldMap);
    void afterDelete(List<sObject> oldList , Map<Id, sObject> oldMap);

    void afterUnDelete(List<sObject> newList, Map<Id, sObject> newMap);
    Boolean isDisabled();

}