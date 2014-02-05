class Button {

  Vec2D pos;
  float radius;
  float currRadius;
  boolean isRollover;
  
  color colOff=#333333;
  color colOn=#00ffff;
  
  Button(Vec2D pos, float radius) {
    this.pos=pos;
    this.radius=radius;
    this.currRadius=radius;
  }

  void render() {
    if (isRollover) {
      fill(colOn);
      currRadius=lerp(currRadius,radius*1.25,0.2);
    } 
    else {
      fill(colOff);
      currRadius=lerp(currRadius,radius,0.05);
    }
    noStroke();
    ellipseMode(RADIUS);
    ellipse(pos.x,pos.y,currRadius,currRadius);
  }

  void rollover() {
    float d=pos.distanceTo(new Vec2D(mouseX,mouseY));
    if (d<radius) {
      isRollover=true;
    } 
    else {
      isRollover=false;
    }
  }
  
  boolean click() {
    return isRollover;
  }
  
  void setColors(color off, color on) {
    colOff=off;
    colOn=on;
  }
}

