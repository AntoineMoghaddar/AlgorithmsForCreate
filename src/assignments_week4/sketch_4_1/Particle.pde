class Particle {
  //declare the variables of the particle
  PVector locationP, velocityP, accelerationP;
  float lifeTime;

  Particle(PVector startLocation) {
    //define the variables of the particle
    accelerationP = new PVector(0, -0.1);
    velocityP = new PVector(random(-0.2, 2.75), random(0, 0));
    locationP = startLocation.copy();
    lifeTime = 255.0;
  }

  //combine 2 voids to 1 void
  void run() {
    update();
    display();
  }

  //update of the particle location and color
  void update() {
    velocityP.add(accelerationP);
    locationP.add(velocityP);
    lifeTime -= 2.5;
  }

  //define the particle
  void display() {
    noStroke();
    fill(255, 255, 255, lifeTime);
    ellipse(locationP.x, locationP.y, 15, 15);
  }

  Boolean deadParticle() {
    if (lifeTime <= 0) return true;
    else return false;
  }
}
