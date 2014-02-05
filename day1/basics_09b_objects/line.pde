class Line {
  float position;
  float weight;
  float speed;
  color col;

  // a boolean value can only either be true or false
  // it's equivalent to a switch/flag
  boolean isVertical;
  
  Line() {
    weight = random(1,10);
    speed = random(0.5, 5);
    col = color(random(255), random(255), random(255));
    // here we decide if the line is vertical or horizontal
    // based on the outcome of the condition below
    // we are basically asking this:
    // is the random number picked less than 50? true or false... 
    isVertical = (random(100) < 50);
  }

  void update() {
    position += speed;
    if (isVertical) {
      position %= width;
    } 
    else {
      position %= height;
    }
  }

  void draw() {
    strokeWeight(weight);
    stroke(col);
    if (isVertical) {
      line(position, 0, position, height);
    } 
    else {
      line(0, position, width, position);
    }
  }
}

