//In this class I drew a raindrop and set the yspeed so it falls down

class Drop {
  PVector speed;
  PVector gravity;
  PVector location; //give every raindrop a random starting position
  float xo, xi, n1; //floats for x-offset, x-increment, and noise

  Drop() {
    speed = new PVector(0, 6);
    gravity = new PVector(0, 0.05);
    location = new PVector(int(random(-200, width+200)), int(random(-1000, 500))); //give every raindrop a random starting position
    xo = 0;

    for (int i = 0; i < width; i++) {
      xi = random(0.006, 0.002);
    }
  }

  void updateDrop() {
    //generate perlin noise
    n1 = noise(xo)*width;
    xo += xi;

    //add realistic falling behavior to the rain drops
    location.add(speed);
    speed.add(gravity);

    //reset position of rain drops after falling off the screen
    if (location.y > height) {      
      location.y = -100;            
      speed.set(0, 0);
    }
  }

  //appearance of one raindrop
  void renderDrop() {
    fill(20, 90, 245);
    noStroke();
    ellipse(location.x + n1 - 250, location.y, 4, 8);
  }
}
