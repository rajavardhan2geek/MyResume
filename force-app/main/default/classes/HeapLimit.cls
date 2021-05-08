public class HeapLimit {
      public static  void myTest(){
        String tStr = 'aaaaa bbbbb ccccc ddddd eeeeee fffff ggggg 11111 22222 33333 44444';
        List<String> baseList = tStr.split(' ');
        List<String> bigList = baseList;
        Map<integer, List<String>> SampleMap = new Map<integer, List<String>>();
        SampleMap.put(1, bigList);
          try{
        for (integer i=0; i<50; i++) {
            List<String> tempList = new List<String>();
            tempList = SampleMap.get(1);
            bigList.addAll(tempList);
             system.debug('FINAL LIST SIZE IS '+bigList.size());
          if(Limits.getHeapSize()>6000000)
             throw new LimitHeapException('Heap Limit Exception');
        }
          }
          catch(LimitHeapException e){
        system.debug('Exception '+e.getMessage()+'Line number'+e.getLineNumber() );
          }
    }
}