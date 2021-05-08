global class BatchFile implements Database.Batchable<sObject> {
global Iterable<sObject> start(Database.BatchableContext bc) {
    
    String idcd='0697F00000lzH5iQAE';
    String query ='select Id,ContentDocumentId From ContentDocumentLink where LinkedEntityId in (select Id from Account) and ContentDocumentId ='+'\''+String.escapeSingleQuotes(idcd)+'\'';
  //  List<ContentDocumentLink> cdllist = Database.query(query);
   // System.debug('success'+cdllist);
    return Database.query(query);
}
    
global void  execute(Database.BatchableContext bc,list<ContentDocumentLink> cdlinks) {
    System.debug('success'+cdlinks);
    Set<Id> cdocsIds = new Set<Id>();
    for(ContentDocumentLink cdlink :cdlinks){
        cdocsIds.add(cdlink.ContentDocumentId);
    }
     List<ContentVersion> newCVList = new  List<ContentVersion>();
    List<ContentVersion> cvList= [select Id,CreatedDate,FileExtension,PathOnClient,Origin,LastModifiedById,NetworkId,LastModifiedDate,FileType,VersionData,FirstPublishLocationId,original_record_id__c,Title,SharingPrivacy,Description From ContentVersion where ContentDocumentId in :cdocsIds ];
    for(ContentVersion cv1:cvList){
        ContentVersion newcv= new ContentVersion();
        newcv.CreatedDate =System.today()-2;
        newCV.LastModifiedDate=System.today()-2;
      	newCV.PathOnClient=cv1.PathOnClient;
        newCV.FirstPublishLocationId=cv1.original_record_id__c;
 
        newcv.VersionData=cv1.VersionData;
        newcv.original_record_id__c=cv1.original_record_id__c;
        newcv.Origin= cv1.Origin;
    //  newcv.FileType=cv1.FileType;
       newCV.NetworkId=cv1.NetworkId;
        newCV.SharingPrivacy=cv1.SharingPrivacy;
        newCVList.add(newCV);
        
    }
    List<ContentDocument> cdoc= new List<ContentDocument>();
    for( Id cdocid:cdocsIds){
        cdoc.add(new ContentDocument(Id=cdocid));
    }
    if(cdoc.size()>0)
     delete cdoc;
    if(newCVList.size()>0)
        insert newCVList;
    System.debug('success'+newCVList);
}
    
    
 global void  finish(Database.BatchableContext BC) {}
}