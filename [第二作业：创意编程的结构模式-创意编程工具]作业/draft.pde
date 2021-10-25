// 根据鼠标位置和速度绘制不同大小的正方形
void setup() {
  size(800, 600);
  background(80);
  rectMode(CENTER);
}

void draw() {
  //根据鼠标的当前速度和位置，绘制圆的位置和大小
  drawEllipse(mouseX, mouseY, pmouseX, pmouseY);
}


//参数：鼠标x，y坐标，x方向速度和y方向速度
void drawEllipse(int x, int y, int px, int py) {
  float speed = 2*(abs(x-px) + abs(y-py));
  stroke(speed);//边框颜色
  rect(x, y, speed, speed);//圆的位置与大小
}
