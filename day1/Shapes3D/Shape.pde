class Shape {
  Vec3D position;
  Vec3D speed;
  color col;
  int age,maxAge;
  
  Shape() {
    position=new Vec3D();
    speed=Vec3D.randomVector().scale(random(1,5));
    col=color(random(255),random(255),random(255));
    maxAge=(int)random(500,1000);
  }
  
  void update() {
    position.addSelf(speed);
    age++;
    if (age==maxAge) {
      position.clear();
      age=0;
    }
  }
  
  void render() {
    fill(col);
    pushMatrix();
    translate(position.x,position.y,position.z);
    rect(0,0,50,50);
    popMatrix();
  }
}
