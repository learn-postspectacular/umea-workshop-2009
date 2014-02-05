class Line {
  float position;
  float weight;
  float speed;
  color col;

  Line() {
    weight = random(1,10);
    speed = random(0.5, 5);
    col = color(random(255), random(255), random(255));
  }

  void update() {
    position += speed;
    position %= width;
  }

  void draw() {
    strokeWeight(weight);
    stroke(col);
    line(position, 0, position, height);
  }
}


