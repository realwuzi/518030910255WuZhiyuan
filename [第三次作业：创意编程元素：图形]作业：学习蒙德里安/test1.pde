//test1
void setup() {
  size(800, 800);
  background(220, 220, 220);
  drawHorizon(0,350,800);
  drawHorizon(0,520,800);
  drawHorizon(350,750,240);
  drawVertical(350,0,800);
  drawVertical(80,520,280);
  drawVertical(590,520,280);
}

void drawHorizon(int posX, int posY, int l){
  stroke(0);
  strokeWeight(20);
  strokeCap(SQUARE);
  line(posX, posY, posX+l, posY);
}
void drawVertical(int posX, int posY, int l){
  stroke(0);
  strokeWeight(20);
  strokeCap(SQUARE);
  line(posX, posY, posX, posY+l);
}
