import toxi.geom.*;
import toxi.audio.*;

MediaPlayer player;

Button playButton;
Button skipButton;

void setup() {
  size(800,600);
  
  //player=new SoundPlayer();
  ImagePlayer p = new ImagePlayer();
  p.addImage("imga.jpg");
  p.addImage("foo.jpg");
  p.addImage("blah.jpg");
  player = p;
  
  playButton=new TextButton(new Vec2D(100,100),25,"play it!");
  skipButton=new TextButton(new Vec2D(175,100),25,"skip");
  PFont f=loadFont("Futura-Medium-14.vlw");
  f=createFont("Sans-serif",14);
  textFont(f);
  textAlign(CENTER);
}

void draw() {
  background(#ff0000);
  player.update();
  playButton.render();
  skipButton.render();
}

void keyPressed() {
  if (key==' ') {  // key = char
    player.playItem();
  }
  if (key=='s') {
    player.skipItem();
  }
}

void mouseMoved() {
  playButton.rollover();
  skipButton.rollover();
}

void mousePressed() {
  if (playButton.click()) {
    player.playItem();
  }
  if (skipButton.click()) {
    player.skipItem();
  }
}
