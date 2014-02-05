class Triangle extends Shape {
  
  Vec3D a,b,c;
  
  Triangle() {
    a=Vec3D.randomVector().scale(50);
    b=Vec3D.randomVector().scale(50);
    c=Vec3D.randomVector().scale(50);
  }
  
  void render() {
    fill(col);
    pushMatrix();
    translate(position.x,position.y,position.z);
    beginShape(TRIANGLES);
    vertex(a.x,a.y,a.z);
    vertex(b.x,b.y,b.z);
    vertex(c.x,c.y,c.z);
    endShape();
    popMatrix();
  }
}
