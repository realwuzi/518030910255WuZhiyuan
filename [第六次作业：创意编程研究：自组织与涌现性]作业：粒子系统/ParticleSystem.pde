Particle[] particles = new Particle[20];

void setup() {
  size(1200, 800);
  initiateParticleSystem();
}

void initiateParticleSystem() {
  for (int  i = 0; i < particles.length; i ++) {
    float pxx = random(width/2-300, width/2+300);
    float pyy = random(height/2-300, height/2+300);
    PVector ploc = new PVector(pxx, pyy);
    particles[i] = new Particle(ploc, 10);
  }
}

void draw() {
  //background(0);
  fill(0, 5);
  noStroke();
  rect(0, 0, width, height);//overlapping
  for (int  i = 0; i < particles.length; i ++) {
    particles[i].run();
  }
  // saveFrame("/motionPics/result-######.png");
}
