// this is a variable, it can (only) store numbers
int x = 0;

void setup() {
  size(200, 200);
}

void draw() {
  background(255);
  // how about more than a single line?
  line(x, 0, x, height);

  // move it! (x++ is shorthand for x=x+1)
  x++;
  // or use the vertical mouse position to control speed
  //x += mouseY;

  // here we check if we have reached the right side of the screen
  // and if so subtract the screen width from x to start again
  // from the left
  if (x > width) {
    x = x - width;
  }
}

