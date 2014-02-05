class RFIDController extends RFIDEventAdapter {
  
  HashMap tagMessages=new HashMap();
  
  String tagID;
  long touchTime;
  boolean isTagActive;
  
  void addMapping(String hash, String message) {
    tagMessages.put(hash,message);
  }
  
  String getMessage() {
    String m=(String)tagMessages.get(tagID);
    if (m==null) {
      m="no mapping found";
    }
    return m;
  }
  
  void tagRead(RFIDReader r, String tag) {
    tagID=tag;
    touchTime=System.currentTimeMillis();
    isTagActive=true;
    System.out.println("read:"+tagID);
  }
  
  void tagLost(RFIDReader r, String tag) {
    isTagActive=false;
  }
}
