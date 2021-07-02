class Rain {
  Drop drop;
  Drop[] drops = new Drop[600];

  int allDrops;

  Rain(int dropAmount) {
    allDrops = dropAmount;

    for (int i = 0; i < allDrops; i++) {
      drops[i] = new Drop();
    }
  }

  void update() {
    for (int i = 0; i < drops.length; i++) {
      drops[i].updateDrop();
    }
  }

  void render() {
    for (int i = 0; i < drops.length; i++) {
      drops[i].renderDrop();
    }
  }
}
