float ang = 0;
float size = 10;
String[] str;
void setup() {
  size(800, 800);
  background(220, 220, 220);
  translate(400, 400);
  str = loadStrings("22.txt");

  for(int i=0; i<str[0].length(); i++,ang += 5.0,size += 0.3){
      // drawpoint(ang);
      char c = str[0].charAt(i);
      drawtheChar(c,ang,size,120);
  }
}

void drawtheChar(char c, float ang, float size, int col){
  PVector pos = getpos(ang);
  textAlign(CENTER, CENTER);//水平居中，垂直居中
  textSize(int(size));
  fill(col);
  text(c, pos.x, pos.y);
}
void drawpoint(float a){
  PVector pos = getpos(a);
  fill(0);
  ellipse(pos.x, pos.y, 10, 10);
}

PVector getpos(float a){//给角度返回坐标点
  float r = 1+0.25*a;
  PVector pos = new PVector();
  pos.x = int(r*cos(a));
  pos.y = int(r*sin(a));
  return pos;
}
