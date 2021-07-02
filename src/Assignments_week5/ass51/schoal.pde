class Schoal {
  ArrayList<Fish> fish; // create an arraylist that resembles in a schoal of fish

  Schoal() {
    fish = new ArrayList<Fish>();
  }

  void run() {
    for (Fish B : fish) { // give the information to every fish 
      B.run(fish); // pass the values earlier stored in the array list to the fish
    }
  }
 
  void addFish(Fish B) { 
    fish.add(B); // add one element of the entity 'fish'
  }
}
