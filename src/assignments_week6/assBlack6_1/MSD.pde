// This class is the mass - spring - damper
class MSD {
    float velocity;
  float force = 1; // an initial force, will be modified
  float friction = 0.01;  
  float angle;
  float spring = 100; 
  float mass = 10;


  MSD(float v) { // pass the velocity
    velocity = v; // in the flower class, you are able to apply an intial velocity to the system
  }

  // the following method calculates the velocity, the angular rotation and the friction 
  void calculate() {
    velocity += -force/mass; // add a negative accelaration to the velocity (methematically this would be an integral) 
    angle += velocity; 
    force = angle/spring + friction*velocity; // the first part of the formula is the angular rotation and the second part is the applied friction
  }
}
