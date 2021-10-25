//test2
color backColor = color(250, 240, 220);
color cred1 = color(210, 60, 20);
color cred2 = color(220, 40, 60);
color cblue = color(0, 100, 160);
color cblack = color(40, 40, 40);
int thick = 10;//thick of black
int num1 = 7, num2 = 10;

void setup() {
  size(800,800);
  background(backColor);
  for(int i=0; i<num1; i++){
    DrawRect1(int(random(width)), int(random(height)), int(random(80,160)),cred1);
    DrawRect1(int(random(width)), int(random(height)), int(random(60,100)),cred2);
    DrawRect1(int(random(width)), int(random(height)), int(random(60,120)),cblue);
  }
  for(int j=0; j<num2; j++){//black stick
    DrawRect2(int(random(width)), int(random(height)), int(random(20,70)), thick, cblack);
    DrawRect2(int(random(width)), int(random(height)), thick, int(random(20,70)), cblack);
  }
}

void DrawRect1(int posX, int posY, int w, color c) {//red blue
  rectMode(CENTER);
  noStroke();
  fill(c);
  rect(posX, posY, w, w);
}
void DrawRect2(int posX, int posY, int w, int h, color c) {
  rectMode(CENTER);
  noStroke();
  fill(c);
  rect(posX, posY, w, h);
}
