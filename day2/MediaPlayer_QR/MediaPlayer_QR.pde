import processing.video.*;

import toxi.geom.*;
import toxi.audio.*;

String QRCODE_PLAY_TEXT="play me";
String QRCODE_SKIP_TEXT="whatever";

MediaPlayer[] players=new MediaPlayer[2];
int currPlayerID=0;

Button playButton;
Button nextButton;
Button switchButton;

Capture cam;

int lastQRCode;

void setup() {
  size(640,400);
  
  cam = new Capture(this, width, height);
  //cam.settings();

  MediaPlayer p=new SoundPlayer();
  p.addItem("sound0.wav");
  p.addItem("sound1.wav");
  p.addItem("sound2.wav");
  players[0]=p;
  
  p = new ImagePlayer();
  p.addItem("test.jpg");
  p.addItem("decode.jpg");
  p.addItem("crop.jpg");
  p.addItem("grey.jpg");
  p.addItem("intense.jpg");
  players[1] = p;
  
  playButton=new TextButton(new Vec2D(width/2-140,height-100),50,"play it!");
  nextButton=new TextButton(new Vec2D(width/2,height-100),50,"next");
  nextButton.setColors(#333333, #ccff00);
  switchButton=new TextButton(new Vec2D(width/2+140,height-100),50,"switch player");
  switchButton.setColors(#333333, #ff0044);
  
  PFont f=loadFont("Futura-Medium-14.vlw");
  textFont(f);
}

void draw() {
  if (cam.available()) {
    cam.read();
    if (millis()-lastQRCode > 2000) {
      PImageMonochromeBitmapSource memImg=new PImageMonochromeBitmapSource(cam);
      try {
        String content=new MultiFormatReader().decode(memImg).getText();
        if (content.equalsIgnoreCase(QRCODE_PLAY_TEXT)) {
          players[currPlayerID].playItem();
          lastQRCode=millis();
        } else if (content.equalsIgnoreCase(QRCODE_SKIP_TEXT)) {
          players[currPlayerID].skipItem();
          lastQRCode=millis();
        }
      } catch(ReaderException e) {
        //println("no code found");
      }
    }
  }
  background(0);
  players[currPlayerID].update();
  playButton.render();
  nextButton.render();
  switchButton.render();
  image(cam,0,0,160,120);
}

void keyPressed() {
  if (key==' ') { // key is type char
    players[currPlayerID].playItem();
  }
  else if (key=='n') {
    players[currPlayerID].skipItem();
  }
  else if (key=='s') {
    switchPlayer();
  }
}

void mouseMoved() {
  playButton.rollover();
  nextButton.rollover();
  switchButton.rollover();
}

void mousePressed() {
  if (playButton.click()) {
    players[currPlayerID].playItem();
  }
  if (nextButton.click()) {
    players[currPlayerID].skipItem();
  }
  if (switchButton.click()) {
    switchPlayer();
  }
}

void switchPlayer() {
  currPlayerID=(currPlayerID+1) % players.length;
  players[currPlayerID].playItem();
}
