float speed = 0;
float easing = 0.07;
int bottonwidth = 60, bottonheight= 30,botton_radius = 25;
int modeflag = 0, colorflag = 0;
int particalSize = 15,d=20;//distance
void setup() {
  size(1200,800);
  background(0);
  textAlign(LEFT);
  textSize(20);
  noStroke();
  init();
}
void init(){
  stroke(255);
  translate(0, 0);
  //color
  text("color:", 20, 50);
  fill(255,0,0);
  rect(80, 30, bottonwidth, bottonheight, botton_radius);//rect1
  fill(0,0,255);
  rect(150, 30, bottonwidth, bottonheight, botton_radius);//rect2

  //mode
  fill(255);
  text("mode:", 20, 110);
  rect(80, 80, bottonwidth, bottonwidth);//rect3
  ellipse(180,110, bottonwidth, bottonwidth);//ellipse
  noStroke();
}
void chose_color_mode(){
  if((mouseY>30)&&(mouseY<60)&&(mouseX>80)&&(mouseX<140)&&(mouseButton == RIGHT))colorflag=0;
  else if((mouseY>30)&&(mouseY<60)&&(mouseX>150)&&(mouseX<210)&&(mouseButton == RIGHT))colorflag=1;
  else if((mouseY>80)&&(mouseY<140)&&(mouseX>80)&&(mouseX<140)&&(mouseButton == RIGHT))modeflag=0;
  else{
    float d = sq(mouseX-180)+sq(mouseY-110);
    if (d < bottonwidth*bottonwidth)modeflag=1;
  }
}
void draw() {
  chose_color_mode();
  if(colorflag==0)fill(255,0,0);
  else if(colorflag==1)fill(0,0,255);
  if (modeflag==0&&mouseButton==LEFT) {
    rectMode(CENTER);
    rect(mouseX + d, mouseY, particalSize, particalSize);
    rect(mouseX - d, mouseY, particalSize, particalSize);
    rect(mouseX, mouseY + d, particalSize, particalSize);
    rect(mouseX, mouseY - d, particalSize, particalSize);
  }
  if (modeflag==1&&mouseButton==LEFT) {
    ellipse(mouseX + d, mouseY, particalSize, particalSize);
    ellipse(mouseX - d, mouseY, particalSize, particalSize);
    ellipse(mouseX, mouseY + d, particalSize, particalSize);
    ellipse(mouseX, mouseY - d, particalSize, particalSize);
  }
}
