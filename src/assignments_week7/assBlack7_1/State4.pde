/*
State 4: snow.
 this state "snow" defines one of the five states
 in this state you can generate up until a number of snowflakes, which will come out of a giant cloud. 
 */

class State4 extends Screen {
  int points =0;
  int timer;
  PImage snow2, cloud;
  SnowFlake[] flake;

  State4(ScreenState[] nextStates) {
    super(nextStates);
    
    //reference: https://accucut.com/products/snowflake-frame
    snow2 = loadImage ("s2.png");
    cloud = loadImage("cloud.png");

    flake = new SnowFlake [MAX_POINTS_4 +1]; // create one more, as it otherwise will not display the last one
    for (int i = 0; i< flake.length-1; i++) {
      flake[i] = new SnowFlake(snow2, random(100, width-100), random(100, 150));
    }
  }

  void draw() {
    background(122, 122, 122);
    text("Click on a key to spawn snowflakes, as fast as you can! ", 20, 450);


    // if you are too late, go back to this state
    if (millis() - timer > TIME_GAME_4) {
      goToState(nextStates[1]);
    }
    if (points >= MAX_POINTS_4) {
      goToState(nextStates[0]);
    }

    for (int i = 0; i < points; i++) {
      flake[i].display();
      flake[i].falldown();
    }
    pushMatrix();
    translate(width/2, 50);
    pushStyle();
    imageMode(CENTER);
    rotate(PI);
    image(cloud, 0, 0, 500, -150);
    popStyle();
    popMatrix();
  }

  void reset() {
    points = 0;
    timer = millis();
  }

  void handleKeyPress() {
    // create more snowflakes, as a key is pressed
    if (key != CODED) {
      points++;
    }
  }
}
