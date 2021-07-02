Schoal schoal;

PImage bg; 
Boat boat;

void setup() {

  size(900, 579);
  //Set new flock
  schoal = new Schoal();
  bg = loadImage("img.jpg"); // background image

  boat = new Boat(width/2, height/2);
}

void draw() {  
  //tree
  pushMatrix();
  scale(1);
  image(bg, 0, 0);
  popMatrix();
  // display a boat 
  boat.display();
  schoal.run();
}

void keyPressed() {
  if (key == ' ') {
    for (int i = 0; i < 50; i++) {
      Fish f = new Fish(); 
      schoal.addFish(f); 
    }
  }
}
