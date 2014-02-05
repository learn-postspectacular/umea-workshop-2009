import toxi.color.*;
import toxi.color.theory.*;

import toxi.geom.*;
import toxi.math.*;

String RED_TAG="13004c86a4";
String GREEN_TAG="13004c3230";
String BLUE_TAG="13004c3365";

RFIDReader rfid;
RFIDController ctrl;

TColor mixedColor=TColor.newRGB(0,0,0);

void setup() {
  size(200,200);
  rfid=new RFIDReader();
  if (rfid.init()) {
    ctrl=new RFIDController();
    ctrl.addMapping(RED_TAG,"Red RFID rocks");
    ctrl.addMapping(GREEN_TAG,"Green god dag! :)");
    ctrl.addMapping(BLUE_TAG,"Blue snow!");
    rfid.addListener(ctrl);
    RFIDEventAdapter ea=ctrl;
    ctrl.tagRead(rfid,"foo");
  } 
  else {
    exit();
  }
  textFont(createFont("Sans-serif",12));
}

void draw() {
  if (ctrl.isTagActive) {
    if(ctrl.tagID.equalsIgnoreCase(RED_TAG)) {
      float r=(mixedColor.red()+0.01) % 1;
      mixedColor.setRed(r);
    } 
    else if(ctrl.tagID.equalsIgnoreCase(GREEN_TAG)) {
      float g=(mixedColor.green()+0.01) % 1;
      mixedColor.setGreen(g);
    } 
    if(ctrl.tagID.equalsIgnoreCase(BLUE_TAG)) {
      float b=(mixedColor.blue()+0.01) % 1;
      mixedColor.setBlue(b);
    }
  }
  background(mixedColor.toARGB());
  if (ctrl.isTagActive) {
    fill(mixedColor.copy().invert().toARGB());
    text(ctrl.getMessage(),20,20);
  }
}

public void stop() {
  if (rfid!=null) {
    rfid.stop();
  }
  super.stop();
}


