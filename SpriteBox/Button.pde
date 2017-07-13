class Button {
  
  PVector pos;
  PImage icon;
  int index;
  color c = color(0,0,0,108);
  float ang = 0;
  int rotDir = 0;

  Button(float x, float y, int i, String imgPath) {
    pos = new PVector(x,y);
    icon = loadImage(imgPath);
    index = i;
  }
  
  void update() {
    if (rotDir == 0) ang += 0.005;
    if (rotDir == 1) ang -= 0.005;
    if (ang >= 0.02) rotDir=1;
    if (ang <= -0.02) rotDir=0;
  }
  
  void draw() {
    pushMatrix();
    translate(pos.x, pos.y);
    if (selection == index) rotate(ang);
    fill(c);
    rect(-(iconSize * 1.05) / 2 - 10,-iconSize / 2 - 20, iconSize * 1.05, iconSize * 1.05);
    image(icon, -iconSize/2, -iconSize/2, iconSize, iconSize);
    popMatrix();
  }
  
  void run() {
    update();
    draw();
  }
  
}