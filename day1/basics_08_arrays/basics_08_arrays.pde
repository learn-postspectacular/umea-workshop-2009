// now x is an array variable, it can store several numbers
// in this case the x position of each line
// you can recognize arrays from the [] syntax 
float[] x = new float[5];

// we also want each line to move at different speeds
// we make the size of this array the same as that of x
float[] speed = new float[x.length];

void setup() {
  size(200, 200);
  // pick random speeds for each line
  for(int i = 0; i < speed.length; i++) {
    // the [] is used to refer to a certain slot/index of the array
    speed[i] = random(0.5, 5);
  }
}

void draw() {
  background(255);
  // now we loop over all array entries
  for(int i = 0; i < x.length; i++) {
    // add the related speed to each position
    x[i] += speed[i];
    // the % operator produces the remainder of a division
    // and in this case can be used instead of the previous if() statement
    // to keep the lines within the defined screen region
    x[i] = x[i] % width;
    // now draw the line at the new position
    line(x[i], 0, x[i], height);
  }
}

// how about adding more attributes (e.g. colour, orientation) to each line?
