final boolean literal = false; 

ArrayList<AbstractObject> drawingObjects = new ArrayList<AbstractObject>();

void setup() {
  size(600, 800);
  background(255);
  unitTests();
}

void draw() {
 if (literal) {
   background(255);
 }
 for (AbstractObject obj : drawingObjects) {
   obj.draw();
 }
}

void keyPressed() {
  switch (key) {
    case 'f':
      drawingObjects.add(new Flower(mouseX, mouseY));
      break;
    case 's':
      save("ForJil.png");
      break;
    default:
      println("no key found, pressed: " + key);
      break;
  }
}

float angleBetween(PVector a, PVector b) {
 return acos(dot(a, b) / (a.mag() * b.mag()));
}

float dot(PVector a, PVector b) {
 return  (a.x * b.x) + (a.y * b.y);
}

int randomNegative() {
  if (random(1) < .5) {
    return -1; 
  }
  return 1;
}

void unitTests() {
 println(
   angleBetween(
     new PVector(0, 1),
     new PVector(1, 0)
   )
 );
 
 println(
   angleBetween(
     new PVector(0, 1),
     new PVector(1, 1)
   )
 );
}
