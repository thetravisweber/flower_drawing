class Flower implements AbstractObject {
  
  ArrayList<Swimmer> swimmers = new ArrayList<Swimmer>();
  
  public Flower(int x, int y) {
    for (int i = 0; i < 300; i++) {
      this.swimmers.add(new Swimmer(x, y, i % TWO_PI, color(242, 136, 167))); 
    }
  }
  
  public void draw() {
    for (Swimmer nemo : this.swimmers) {
      nemo.draw();
      nemo.move();
    } 
  }
}
