void setup() {
  size(800, 600);
}

void draw() {
  // mouseX & mouseY store the CURRENT mouse position
  // pmouseX & pmouseY keep hold of the PREVIOUS mouse position
  float distance=dist(pmouseX, pmouseY, mouseX, mouseY);
  strokeWeight(distance*0.25);
  line(pmouseX, pmouseY, mouseX, mouseY);
  // uncomment the line below to export each frame
  //saveFrame("doodle-####.tga");
}

