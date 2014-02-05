import toxi.color.*;
import toxi.color.theory.*;

import toxi.util.datatypes.*;

import toxi.geom.*;
import toxi.math.*;

Twitter twitter = new Twitter("ixdumea","$Hg*lM-2TaJ");

HashMap knownUsers = new HashMap();

RFIDReader rfid;
RFIDController ctrl;

TColor heatCol=TColor.BLACK.copy();

void setup() {
  size(600,200);
  TypedProperties config = new TypedProperties();
  config.load(dataPath("users.txt"));
  for(Enumeration e=config.propertyNames(); e.hasMoreElements();) {
    String tag=((String)e.nextElement()).toLowerCase();
    String userName=(String)config.get(tag);
    User u=new User(tag,userName);
    knownUsers.put(tag,u);
  }
  rfid=new RFIDReader();
  if (rfid.init()) {
    ctrl=new RFIDController();
    rfid.addListener(ctrl);
  } 
  else {
    exit();
  }
  textFont(createFont("Sans-serif",40));
}

void draw() {
  float hue=lerp(TColor.BLUE.hue(),1,(float) ctrl.currentUsers/knownUsers.size());
  heatCol.setHSV(new float[]{hue,1,1});
  background(heatCol.toARGB());
  fill(255);
  text(ctrl.currentUsers+" users are here",20,100);
}

public void stop() {
  if (rfid!=null) {
    rfid.stop();
  }
  super.stop();
}
