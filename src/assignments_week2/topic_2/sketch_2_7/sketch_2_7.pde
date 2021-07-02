float increment = 0.02;
float zoff = 0.0;
float zincrement = 0.045;

void setup() {
  size(1500, 500);
}

void draw() {
  background(0);
  loadPixels();

  // create random noise values, to have a difference in the brightness
  float xoff = 0.0; 
  for (int x = 0; x < width; x++) {
    xoff += increment;   
    float yoff = 0.0;   
    for (int y = 0; y < height; y++) {
      yoff += increment; 

      // continuously change the clouds pattern; in a 3D space 
      float bright = noise(xoff,yoff,zoff)*255;

      // it generates the picture 
      pixels[x+y*width] = color(bright);
    }
  }

  updatePixels();
  zoff += zincrement;
}
