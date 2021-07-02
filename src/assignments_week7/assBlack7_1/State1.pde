/*
State 1: clouds.
 this state "clouds" defines one of the five states
 it creates clouds, randomly on the screen and they depend on the time left of the game 1, defined in class "constants".
 
 */

class State1 extends Screen {
  int timer;

  PImage cloud;
  PVector [] cloudLocation = new PVector [10];

  State1(ScreenState[] nextStates) {
    super(nextStates);
    
    // reference: image of a cloud, purepng.com, https://purepng.com/photo/1/nature-white-cloud, accessed the 14th of June 2019
    cloud = loadImage("cloud.png");
    for (int i = 0; i<cloudLocation.length; i++) {
      cloudLocation[i] = new PVector(random(0, width), random(0, height/3));
    }
  }

  void draw() {
    background (#837F7F);
    textSize(11); 

    int timeLeft = (TIME_GAME_1 - millis() + timer) / 1000;
    fill(255);
    ellipse(53, height-55, 20, 20);
    fill(0);
    text( timeLeft, 50, height-50);

    for (int i = 0; i < timeLeft; i++) {
      pushStyle();
      imageMode(CENTER);
      image (cloud, cloudLocation[i].x, cloudLocation[i].y, 150, 100);
      popStyle();
    }

    // conditional transition to a successor state - here with a timer condition
    if ((millis() - timer) > TIME_GAME_1) { 
      goToState(nextStates[0]);
    }

    move();
  }
// this method changes the position of the clouds from left to right.
  void move() {
    for (int i = 0; i<cloudLocation.length; i++) {
      cloudLocation[i].x+=1;
      if (cloudLocation[i].x>width+75) { //border detection
        cloudLocation[i].x = -75;
      }
    }
  }

  void delete() {
  }

  void reset() {
    timer = millis();
  }
}
