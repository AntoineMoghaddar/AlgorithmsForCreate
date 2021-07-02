private int[] count = new int[]{0, 0, 0, 0, 0, 0};

void setup() {
  size(200, 200);
}

void draw() {
  rect(25, 25, 50, 50);
}

void rollDice() {
  int i = (int)random(1, 6);
  count[i-1]++;
}

void printOccurences() {
  for (int i = 0; i < count.length; i++) {
    println((i+1) + " has " + count[i] + " occurences." );
  }
  println();
}

void mouseClicked() {
  rollDice();
  printOccurences();
}
