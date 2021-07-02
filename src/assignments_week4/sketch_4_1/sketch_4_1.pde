Chicken chicken;
ParticleSystem explosion;

// startingPoint of the particleSystem
PVector startPS;

void setup() {
  size(1920, 1080);  
  startPS = new PVector(width/2, height/2);
  explosion = new ParticleSystem(startPS);
  chicken = new Chicken(startPS, explosion);
}

void draw() {
  background(135,206,250);
  chicken.display();
  chicken.moveChicken();
}
