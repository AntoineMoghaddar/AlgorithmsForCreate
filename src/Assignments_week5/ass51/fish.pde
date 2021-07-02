// This class takes care of the elements of a single fish; here the avoiding, the alignment, the separation and the coherence come together

class Fish {
  PVector speed;
  PVector position;
  PVector acceleration;
  float maximumVelocity;
  float maximumForce;


  float fishX, fishY, velX, velY, fSize;
  float sharkX, sharkY;
  PVector acc, vel, pos;
  boolean fishAlive;
  color c;

  // pass the values of parameters of the initial (and eventually) updated position, as they will be saved in an arraylist of class schoal
  Fish() {
    acceleration = new PVector(0, 0);
    speed = new PVector(random(-3, 1), random(-3, 1));
    position = new PVector(random(110, width/2-250), random(110, height-150));
    maximumVelocity = 8;
    maximumForce = 0.1;


    fishX = random(width);
    fishY = random(height);
    sharkX = 1000;
    sharkY = 500;
    pos = new PVector( random(width), random(height) );
    vel = new PVector( 0, 0 );
    acc = new PVector( 0, 0);
    velX = random(0.5, 1);//determine random speed
    velY = random(0.5, 1);
    fSize = random(0.1, 0.5);
    fishAlive = true;
    c = color(random(255), random(255), random(255));
  }

  // combine all the methods, so one fish gets all the elements and store it in the arraylist
  void run(ArrayList<Fish> fish) {
    schoal(fish);
    range();
    update();
    display();
  }

  // this method is needed to set certain intensities to the PVectors
  void schoal (ArrayList<Fish> fishs) {
    PVector dod = dodge();
    PVector spl = splitting (fishs);
    PVector adj = adjustment (fishs);
    PVector coh = cohesion(fishs);

    // give the schoal a common multiplier, that results in the acceleration
    dod.mult(2);
    spl.mult(1.5);
    adj.mult(1);
    coh.mult(0.5);
    acceleration.add(dod).add(spl).add(adj).add(coh); // add up the intensities
  }

  // this method updates the position as a return after methods are called
  void update() {
    speed.add(acceleration);
    speed.limit(maximumVelocity);
    position.add(speed);
    acceleration.mult(0); // return to 0 acceleration
  }

  // this method sees the obstacle and detects it, then steers away from it 
  PVector location (PVector target) {
    PVector desired = PVector.sub(target, position); // give the fish a vector that points away from the obstacle
    desired.normalize();
    desired.mult(maximumVelocity);
    PVector steering = PVector.sub(desired, speed);
    steering.limit(maximumForce);
    return steering;
  }

  // display the body of the fish and adjust the direction of the fish to the speed 
  void display() {
    float theta = speed.heading();
    noStroke();
    fill(255, 150, 0);
    pushMatrix();
    translate(position.x, position.y);
    rotate(theta);
    scale(0.8);
    body();
    popMatrix();
  }

  // this method knows the borders and keeps the fish inside; the method flips the values in order to let the fish head into the opposite direction. 
  // It also makes sure the fish avoid the boat if they want to, the fish will either enter the boat and leave or steer away from it.
  void range() {
    PVector optimal = null;
    float d =400;

    if (position.x < d || position.x<d+width/2) {
      optimal = new PVector(maximumVelocity, speed.y);
    } else if (position.x > width-d || position.x>width/2-d) {
      optimal = new PVector(-maximumVelocity, speed.y);
    } else if (position.y < d || position.y<d+height/2) {
      optimal = new PVector(speed.x, maximumVelocity);
    } else if (position.y > height-d || position.x>height/2-d) {
      optimal = new PVector(speed.x, -maximumVelocity);
    } 
    if (optimal != null) {
      optimal.normalize();
      optimal.mult(maximumVelocity);
      PVector steering = PVector.sub(optimal, speed);
      steering.limit(maximumForce);
      acceleration.add(steering);
    }
  }

  // split the moment the fish are getting too near 
  PVector splitting (ArrayList<Fish> fish) {
    float desiredSeparation = 25.0f;
    PVector steering = new PVector(0, 0, 0);
    int count = 0;

    for (Fish other : fish) { // check every position of the fish in the array list if it is too close 
      float dist = PVector.dist(position, other.position);

      if ((dist > 0) && (dist < desiredSeparation)) {
        PVector diff = PVector.sub(position, other.position);  // create a vector that leads the fish to a different direction 
        diff.normalize();
        diff.div(dist); 
        steering.add(diff);
        count++; // check the amount of fish
      }
    }
    if (count > 0) {
      steering.div((float)count); // divide the steering by the amount of created fish
    }
    if (steering.mag() > 0) {
      // The following is Reynolds formula: this formula the desired speed minus the veloctiy
      steering.normalize();
      steering.mult(maximumVelocity);
      steering.sub(speed);
      steering.limit(maximumForce);
    }
    return steering;
  }

  PVector adjustment (ArrayList<Fish> fish) {
    float neighbourFish = 100;
    PVector summation = new PVector(0, 0);
    int count = 0;
    for (Fish other : fish) {
      float dist = PVector.dist(position, other.position);
      if ((dist > 0) && (dist < neighbourFish)) {
        summation.add(other.speed);
        count++;
      }
    }
    if (count > 0) {
      summation.div((float)count);
      summation.normalize();
      summation.mult(maximumVelocity);
      PVector steering = PVector.sub(summation, speed);
      steering.limit(maximumForce);
      return steering;
    } else {
      return new PVector(0, 0);
    }
  }

  PVector cohesion (ArrayList<Fish> fish) {
    float neighbourFish = 60;
    PVector summation = new PVector(0, 0); // start a new PVector, of which the parameters will be adjusted 
    int count = 0;
    for (Fish other : fish) {
      float dist = PVector.dist(position, other.position); // check the position of the other fish 
      if ((dist > 0) && (dist < neighbourFish)) {
        summation.add(other.position); // cohere with other fish and get their position 
        count++;
      }
    }
    if (count > 0) {
      summation.div(count);
      return location (new PVector(100, 100)); // head into this direction
    } else {
      return new PVector(0, 0);
    }
  }

  PVector dodge () {
    float distElement = 150;
    PVector steering = new PVector(0, 0);
    PVector entity = new PVector(width/2, height/2);
    float dist = PVector.dist(position, entity);

    //bounce away from the boat or border
    if (dist > 0 && dist < distElement) {
      steering.sub(speed.x, speed.y);
    }
    if (position.y < 40 || position.y > height-40) {
      steering.sub(0, speed.y);
    } 
    if (position.x < 40 || position.x > width-40) {
      steering.sub(speed.x, 0);
    }
    return steering;
  }

  // drawing the body of the fish
  //Reference to https://forum.processing.org/one/topic/beginner-s-level-need-some-help-on-how-to-move-a-fish-nicely.html
  void body() {
    float fishX = 20;
    float fishY = 20;

    fill(c);

    translate(fishX, fishY);
    scale(fSize);
    
    if (velX<0) {
      rotateY(PI);
    }
    if (!fishAlive) {  
      rotate(-PI/2);
    } 
    
    ellipse(0, 0, 10, 10);
    //fin
    stroke(0);
    smooth();
    fill(191, 171, 191);
    curve(0, 200, -95, 0, -50, 0, 200, 200);
    curve(0, -500, -95, 0, -50, 0, 200, -100);
    //fin top
    fill(191, 171, 191);
    triangle(0, -20, -20, -70, -40, -20);
    triangle(10, -20, -10, -65, -30, -20);
    triangle(20, -20, 0, -60, -20, -20);
    triangle(30, -20, 10, -55, -10, -20);
    triangle(40, -20, 20, -50, 0, -20);

    //body of the fish
    fill(c);
    arc(0, 0, 100, 110, 0, PI/2);
    arc(0, 0, 120, 140, 0, PI);
    arc(0, 0, 120, 80, PI, TWO_PI-PI/2);
    arc(0, 0, 120, 80, radians(270), radians(360));
    
    //eyes
    fill(255);
    stroke(0);
    ellipse(30, -10, 30, 30);
    ellipse(60, -10, 30, 30);
    fill(0);
    ellipse(30, -10, 5, 5);
    ellipse(60, -10, 5, 5);
    //gill
    fill(191, 171, 191);
    triangle(30, 28, 10, 45, 20, 15);
    fill(191, 171, 120);
    triangle(30, 20, 0, 40, 10, 10);

    //mouth
    fill(255);
    stroke(205, 0, 0);
    strokeWeight(2);
    ellipse(50, 30, 15, 15);
  }
}
