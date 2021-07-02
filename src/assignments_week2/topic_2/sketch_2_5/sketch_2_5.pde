//example taken from processing.org, source: https://processing.org/examples/noise1d.html

float xoff = 0.0;
float xincrement = 0.01;

float yoff = 0.0;
float yincrement = 0.011;

void setup() {
  size(640, 360);
  background(0);
  noStroke();
}

void draw() {
  // Create an alpha blended background
  fill(0, 10);
  rect(0,0,width,height);

  // Get a noise value based on xoff and scale it according to the window's width
  float xPos = noise(xoff)*width;
  float yPos = noise(yoff)*height;

  // With each cycle, increment xoff
  xoff += xincrement;
  yoff += yincrement;

  // Draw the ellipse at the value produced by perlin noise
  fill(200);
  ellipse(xPos,yPos, 64, 64);
}
