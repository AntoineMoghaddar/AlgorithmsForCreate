// This class is the mass - spring - damper
class MSD {
  float velocity =0;
  float frictionForce = 0;
  float frictionConstant;  
  float angle =0;
  float springConstant;
  float mass;

  float force = 5;
  float forceWithin = 0;
  float velocity2 = 0;

  MSD(float fF, float fC, float sC, float m) {
    frictionForce = fF;
    frictionConstant = fC;
    springConstant = sC;
    mass = m;
  }

  // the following method calculates the velocity, the angular rotation and the friction 
  void calculate(float v, float f) {
    float firstForce = f;
    float firstVelocity = v;

    velocity2 += force/mass; 
    velocity = velocity2 - firstVelocity; 
    angle += velocity;
    
    force = angle/springConstant;
    frictionForce = velocity * frictionConstant; 
    forceWithin = force + frictionForce;
    force = -forceWithin + firstForce;

    print(frictionForce);
    print(",");
    print(velocity);
    print(",");
    print(angle);
    println(",");
  }
}
