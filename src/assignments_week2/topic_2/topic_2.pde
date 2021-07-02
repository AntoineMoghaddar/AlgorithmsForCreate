
//Authors
//Antoine Moghaddar S1880241
//Issa Margherita S2563150

//----------------------------------------------------------2.1

//private int[] count = new int[]{0, 0, 0, 0, 0, 0};

//void setup() {
//  size(200, 200);
//}

//void draw() {
//  rect(25, 25, 50, 50);
//}

//void rollDice() {
//  int i = (int)random(1, 7);
//  count[i-1]++;
//}

//void printOccurences() {
//  for (int i = 0; i < count.length; i++) {
//    println((i+1) + " has " + count[i] + " occurences." );
//  }
//  println();
//}

//void mouseClicked() {
//  rollDice();
//  printOccurences();
//}

//----------------------------------------------------------2.2

//private int[] count = new int[]{0, 0, 0, 0, 0, 0};

//void setup() {
//  size(200, 200);
//}

//void draw() {
//  rect(25, 25, 50, 50);
//}

//void rollDice() {
//  int i = (int)random(1, 10);
//  if(i > 6){
//    i = 6;
//  }
//  count[i-1]++;
//}

//void printOccurences() {
//  for (int i = 0; i < count.length; i++) {
//    println((i+1) + " has " + count[i] + " occurences." );
//  }
//  println();
//}

//void mouseClicked() {
//  rollDice();
//  printOccurences();
//}

//----------------------------------------------------------2.3

//Example taken from The Nature of Code by Daniel Shiffman. Source: http://natureofcode.com

//void setup() {
//  size(640, 360);
//  background(255);
//}

//void draw() {
//  // Get a gaussian random number w/ mean of 0 and standard deviation of 1.0
//  float xloc = randomGaussian();
//  float yloc = randomGaussian();
//  float size = randomGaussian();

//  float sd = 60;                // Define a standard deviation
//  float meanx = width/2;         // Define a mean value (middle of the screen along the x-axis)
//  float meany = height/2;

//  float sdSize = 15;
//  float meanSize = 20;

//  yloc = (yloc * sd) + meany;
//  xloc = (xloc * sd) + meanx;  // Scale the gaussian random number by standard deviation and mean

//  size = (size * sdSize) + meanSize;

//  fill(0, 0, 255);
//  noStroke();
//  ellipse(xloc, yloc, size, size);   // Draw an ellipse at our "normal" random position
//}

//----------------------------------------------------------2.4

//Dot[] dots;
//int counter = 0;

//void setup() {
//  dots = new Dot[100000]; // create an array of dots that is large enough to fill the screen
//  size(500, 500);
//  background(255);
//}

//void draw() {
//  background(255);
//  dots[counter] = new Dot(); // places the drawn dots within this array


//  for (int i = 0; i<counter; i++) {
//    while (dist(dots[counter].dotx, dots[counter].doty, dots[i].dotx, dots[i].doty)<(dots[counter].size/2+dots[i].size/2)) {
//      dots[counter].size --; // decrease size if the dots are too near
//    }
//    dots[i].display();
//  }
//  counter ++; // count up until 100 000
//}

//----------------------------------------------------------2.5

//example taken from processing.org, source: https://processing.org/examples/noise1d.html

//float xoff = 0.0;
//float xincrement = 0.01;

//float yoff = 0.0;
//float yincrement = 0.011;

//void setup() {
//  size(640, 360);
//  background(0);
//  noStroke();
//}

//void draw() {
//  // Create an alpha blended background
//  fill(0, 10);
//  rect(0,0,width,height);

//  // Get a noise value based on xoff and scale it according to the window's width
//  float xPos = noise(xoff)*width;
//  float yPos = noise(yoff)*height;

//  // With each cycle, increment xoff
//  xoff += xincrement;
//  yoff += yincrement;

//  // Draw the ellipse at the value produced by perlin noise
//  fill(200);
//  ellipse(xPos,yPos, 64, 64);
//}

//----------------------------------------------------------2.6

//float yo = 0.0; //offsets

//float yi = 0.001; //increments
//float n1; //float for noise

//float Xposition = 0; //starting position terrain
//ArrayList<Rects> rs = new ArrayList<Rects>(); 

//void setup() {
//  size(1500, 500);
//}

//void draw() {
//  noStroke();

//  //terrain
//  n1 = noise(yo)*height;
//  yo += yi;

//  fill(0, 150, 0);
//  noStroke();

//  Xposition += 0.5;
//  rs.add(new Rects(width+Xposition, n1, 1, 300));

//  for (Rects r : rs) {
//    r.decreaseW();
//    r.display();
//  }

//  //car
//  fill(100);
//  ellipse(width/2 + 30, 400, 30, 30);
//  ellipse(width/2 + 90, 400, 30, 30);
//  fill(255, 0, 0);
//  rect(width/2, 360, 120, 30);
//  rect(width/2, 330, 80, 50);

//  //road
//  fill(150);
//  rect(0, 408, width, 200);
//}
//----------------------------------------------------------2.7


//float increment = 0.02;
//float zoff = 0.0;
//float zincrement = 0.045;

//void setup() {
//  size(1500, 500);
//}

//void draw() {
//  background(0);
//  loadPixels();

//  // create random noise values, to have a difference in the brightness
//  float xoff = 0.0; 
//  for (int x = 0; x < width; x++) {
//    xoff += increment;   
//    float yoff = 0.0;   
//    for (int y = 0; y < height; y++) {
//      yoff += increment; 

//      // continuously change the clouds pattern; in a 3D space 
//      float bright = noise(xoff,yoff,zoff)*255;

//      // it generates the picture 
//      pixels[x+y*width] = color(bright);
//    }
//  }

//  updatePixels();
//  zoff += zincrement;
//}

//----------------------------------------------------------2.8

//float[][] grid;
//float xi =0.0, yi=0.0, offset;

//void setup() {
//  size(1000, 1000, P3D);
//  background(100);

//  fill(50);
//  stroke(255);
//  grid = new float[100][100];
//  frameRate(10);
//}

//void draw() {
//  background(10);

//  translate(200, 100);
//  rotateX(PI/5);

//  offset += 0.1;
//  xi = 0;

//  for (int i = 0; i < grid.length-1; i++) {
//    yi = offset;
//    for (int j = 0; j <grid[i].length-1; j++) {
//      grid[i][j] = map(noise(xi, yi), 0, 1, -120, 120);
//      yi+=0.2;
//    }
//    xi+=0.2;
//  }

//  //printing the grid
//  for (int i = 0; i < grid.length-1; i++) {
//    beginShape(QUAD_STRIP);
//    for (int j = 0; j < grid[i].length-1; j++) {
//      fill(255);
//      stroke(0);
//      vertex(8*i, j*8, grid[i][j]);
//      vertex(8*i+8, 8*j, grid[i+1][j]);
//    }
//    endShape();
//  }
//}
