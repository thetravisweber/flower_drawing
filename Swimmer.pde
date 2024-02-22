class Swimmer {
 PVector pos;
 PVector vel;
 PVector acc;
 PVector prevPos;
 PVector originalVel;
 color c;
 final float minimumSpeed = .5;
 final float maximumSpeed = 6;
 final int magVariance = 2;
 final int minMag = 1;
 
 public Swimmer(int x, int y, float theta, color c) {
   this.pos = new PVector(x, y);
   this.c = c;
   float calculatedMag = random(minMag, magVariance + minMag);
   this.vel = new PVector(
     cos(theta) * calculatedMag,
     sin(theta) * calculatedMag
   );
   this.originalVel = this.vel;
   this.acc = new PVector(this.vel.x * -.05, this.vel.y * -.05);
   this.prevPos = this.pos.copy();
 }
 
 public void draw() {
   if (this.isDead()) return;
   if (literal) {
     this.drawLiteral();
   }
   this.drawAbstract();
 }
 
 private void drawAbstract() {
   noStroke();
   fill(this.c, 20-(20/this.vel.mag()));
   ellipse(this.pos.x, this.pos.y, 5, 5);
   line(this.pos.x, this.pos.y, this.prevPos.x, this.prevPos.y);
 }
 
 private void drawLiteral() {
   noStroke();
   fill(0);
   ellipse(this.pos.x, this.pos.y, 10, 10); 
 }
 
 public void move() {
  this.prevPos = this.pos;
  
  if (this.isDead()) return;
  
  this.vel.add(this.randomForce(this.vel.mag() / 10));
  //this.vel.add(this.acc);
  this.vel.mult(.99);
  this.pos.add(this.vel);
 }
 
 private PVector randomForce(float mag) {
   return new PVector(
     random(-mag, mag),
     random(-mag, mag)
   );
 }
 
 private boolean isDead() {
  return(this.vel.mag() < this.minimumSpeed) 
    || (this.vel.mag() > this.maximumSpeed)
    || abs(angleBetween(this.vel, this.originalVel)) > .1;
 }
}
