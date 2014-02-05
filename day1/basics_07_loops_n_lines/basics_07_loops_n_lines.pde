// this is a variable, it can store numbers
int x = 0;

// here we define the desired gap between each line
int gap = 10;

void setup() {
  size(200, 200);
}

void draw() {
  background(255);
  // a loop is a loop...
  // i is a counter variable being increased after each iteration
  // all code within the loop is executed for as long as i is less than 5
  for(int i = 0; i < 5; i++) {
    line(x + i * gap, 0, x + i * gap, height);
  }
  x++;
  if (x > width) {
    x = x - width;
  }
}
