import processing.opengl.*;

import toxi.util.datatypes.*;
import toxi.math.noise.*;
import toxi.math.waves.*;
import toxi.geom.*;
import toxi.math.*;
import toxi.math.conversion.*;
import toxi.geom.util.*;
import toxi.doap.*;

Shape[] lines=new Shape[1000];

void setup() {
  size(800,600,OPENGL);
  noStroke();
  for(int i=0; i<lines.length; i++) {
    if (random(100)<50) {
      lines[i]=new Triangle();
    } 
    else {
      lines[i]=new Shape();
    }
  }
}

void draw() {
  background(255);
  translate(width/2,height/2,0);
  rotateX(mouseY*0.01);
  rotateY(mouseX*0.01);
  scale(0.25);
  for(int i=0; i<lines.length; i++) {
    lines[i].update();
    lines[i].render();
  }
}

