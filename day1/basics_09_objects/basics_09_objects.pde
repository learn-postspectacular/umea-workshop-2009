// now our array is not storing numbers but lines directly
// we can define new custom types like this via classes
Line[] lines = new Line[5];

void setup() {
  size(200, 200);
  // create instances of our new Line class
  for(int i = 0; i < lines.length; i++) {
    lines[i] = new Line();
  }
}

void draw() {
  background(255);
  // now we loop over all array entries
  for(int i = 0; i < lines.length; i++) {
    lines[i].update();
    lines[i].draw();
  }
}

