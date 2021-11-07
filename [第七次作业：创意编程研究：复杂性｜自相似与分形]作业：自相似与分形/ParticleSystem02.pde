int numOfParticles = 6;
int sizeOfParticle = 80;
Particle[] particles = new Particle[numOfParticles];

void setup() {
  size(1200, 800);
  initiateParticleSystem();
}

void initiateParticleSystem() {
  for (int  i = 0; i < particles.length; i ++) {
    float pxx = random(width/2-300, width/2+300);
    float pyy = random(height/2-300, height/2+300);
    PVector ploc = new PVector(pxx, pyy);
    particles[i] = new Particle(ploc, sizeOfParticle);//初始化粒子半径
  }
}


void draw() {
  fill(0, 5);
  // fill(0,0,0);
  noStroke();
  rect(0, 0, width, height);//overlapping
  for (int  i = 0; i < particles.length; i ++) {
    particles[i].run();
  }
  fill(255,0,0);
  ellipse(mouseX,mouseY,10,10);
  saveFrame("/motionPics/result-######.png");
}
