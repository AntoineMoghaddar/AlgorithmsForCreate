//Example taken from The Nature of Code by Daniel Shiffman. Source: http://natureofcode.com

void setup() {
  size(640, 360);
  background(255);
}

void draw() {
  // Get a gaussian random number w/ mean of 0 and standard deviation of 1.0
  float xloc = randomGaussian();
  float yloc = randomGaussian();
  float size = randomGaussian();

  float sd = 60;                // Define a standard deviation
  float meanx = width/2;         // Define a mean value (middle of the screen along the x-axis)
  float meany = height/2;

  float sdSize = 15;
  float meanSize = 20;

  yloc = (yloc * sd) + meany;
  xloc = (xloc * sd) + meanx;  // Scale the gaussian random number by standard deviation and mean

  size = (size * sdSize) + meanSize;

  fill(0, 0, 255);
  noStroke();
  ellipse(xloc, yloc, size, size);   // Draw an ellipse at our "normal" random position
}
