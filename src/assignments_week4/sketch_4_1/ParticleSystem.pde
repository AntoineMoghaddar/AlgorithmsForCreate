import java.util.Iterator;  // Import the class of Iterator

class ParticleSystem {
  //describe var
  ArrayList<Particle> particles;
  PVector locationPS, accelerationPS, velocityPS;

  //constructor + define var
  ParticleSystem(PVector location) {
    particles = new ArrayList<Particle>();
    locationPS = location.copy();
    accelerationPS = new PVector(0.1, 0);
    velocityPS = new PVector(0, 0);
  }

  void movePS(PVector location) {
    locationPS = location.copy();
  }

  //make multiples particles
  void addParticle() {
    particles.add(new Particle(locationPS));
  }

  //make the particles and delete the older particles
  void particleRuler() {
    Iterator<Particle> it = particles.iterator();
    while (it.hasNext()) {
      Particle p = it.next();
      p.run();
      if (p.deadParticle()) {
        it.remove();
      }
    }
  }

  // a void to run all of the voids in this class
  void run(PVector loc) {
    // to make more smoke create 10 particleSystems on the same spot
    for (int i = 0; i<10; i++) {
      addParticle();
    }
    movePS(loc);
    particleRuler();
  }
}
