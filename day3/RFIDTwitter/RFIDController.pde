class RFIDController extends RFIDEventAdapter {

  HashMap tagMessages=new HashMap();

  String tagID;
  long touchTime;
  boolean isTagActive;

  int currentUsers=7;

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
    tagID=tag.toLowerCase();
    touchTime=System.currentTimeMillis();
    isTagActive=true;
    User user=(User)knownUsers.get(tagID);
    if (user!=null) {
      if (user.isHere) {
        sendMessage(user.name+" has left the building... :(");
        currentUsers--;
        user.isHere=false;
      } 
      else {
        sendMessage(user.name+" has just come in. Welcome! :)");
        currentUsers++;
        user.isHere=true;
      }
    }
  }

  void tagLost(RFIDReader r, String tag) {
    isTagActive=false;
  }
}

