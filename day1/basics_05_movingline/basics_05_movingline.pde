// this is a variable, it can (only) store numbers
int x=0;

void setup() {
  size(200, 200);
}

void draw() {
  background(255);
  // how about more than a single line?
  line(x, 0, x, height);
  // move it!
  x = x + 1;
  // ...but how to stop it moving outside the screen?
}

