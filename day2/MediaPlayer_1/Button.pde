class Button {

  Vec2D pos;
  float radius;
  boolean isRollover;

  Button(Vec2D pos, float radius) {
    this.pos=pos;
    this.radius=radius;
  }

  void render() {
    if (isRollover) {
      fill(255);
    } 
    else {
      fill(0);
    }
    ellipseMode(RADIUS);
    ellipse(pos.x,pos.y,radius,radius);
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
}

