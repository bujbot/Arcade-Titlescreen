import ddf.minim.*;

Minim minim;

AudioSample bgmusic;
AudioSample hoverFX;
AudioSample clickFX;
String bgmusictrack="background.mp3";
String hoverFXtrack="hoverFX.wav";
String clickFXtrack="clickFX.wav";
String path1;
String path2;
String path3;

boolean bgmusicplay = false, bgmusicon = false;

PImage[] icon = new PImage[4];
PImage bg;

boolean inc =false, dec =false; //ummm not sure

int screenx=1024;
int screeny=768;

float ang=0;
int rot=0;

int border=1;

int iconsize = 230;
int[] icon1={0+200,100}; //placement of icons
int[] icon2={screenx-200-iconsize,100};
int[] icon3={0+200,430};
int[] icon4={screenx-200-iconsize,430};

boolean wpressed;
boolean spressed;
boolean apressed;
boolean dpressed;
boolean cpressed;

void setup() {
  //size(1024, 768); //MAKE SURE THIS MATCHES "screenx" & "screeny" up above
  frameRate(30);
  fullScreen();
  
  minim = new Minim(this);
 
  for (int k=0;k<4;k++) icon[k] = loadImage(k+".png"); //assign image to all spots
  noStroke();
  
  bg=loadImage("bg.png");
  /*
  path1=sketchPath(bgmusictrack); //background music
  bgmusic=new SoundFile(this, path1);
  
  path2=sketchPath(hoverFXtrack); //hover over icon FX
  hoverFX=new SoundFile(this, path2);
  
  path3=sketchPath(clickFXtrack); //click icon FX
  clickFX=new SoundFile(this, path3);*/
  
  bgmusic=minim.loadSample("background.mp3",512);
  hoverFX=minim.loadSample("hoverFX.wav",512);
  clickFX=minim.loadSample("clickFX.wav",512);
  
}

void draw() {
  background(bg);
  
  if (bgmusicplay==true && bgmusicon==false) {
    bgmusic.trigger();
    bgmusicon=true;
  }
  if (bgmusicplay==false && bgmusicon==true) {
    bgmusic.stop();
    bgmusicon=false;
  }
     
  pushMatrix();
  translate(icon1[0]+iconsize/2+42,icon1[1]+iconsize/2-1);
  if (border==1) rotate(ang);
  fill(0,0,0,108);
  rect(-(iconsize*1.05)/2-10,-iconsize/2-20,iconsize*1.05,iconsize*1.05);
  image(icon[0],-iconsize/2,-iconsize/2,iconsize,iconsize); //place icon 1
  popMatrix();
  
  pushMatrix();
  translate(icon2[0]+iconsize/2-44,icon2[1]+iconsize/2-1);
  if (border==2) rotate(ang);
  fill(0,0,0,108);
  rect(-(iconsize*1.05)/2-10,-iconsize/2-20,iconsize*1.05,iconsize*1.05);
  image(icon[1],-iconsize/2,-iconsize/2,iconsize,iconsize); //place icon 2
  popMatrix();
  
  pushMatrix();
  translate(icon3[0]+iconsize/2+42,icon3[1]+iconsize/2+7);
  if (border==3) rotate(ang);
  fill(0,0,0,108);
  rect(-(iconsize*1.05)/2-10,-iconsize/2-20,iconsize*1.05,iconsize*1.05);
  image(icon[2],-iconsize/2,-iconsize/2,iconsize,iconsize); //place icon 3
  popMatrix();
  
  pushMatrix();
  translate(icon4[0]+iconsize/2-44,icon3[1]+iconsize/2+7);
  if (border==4) rotate(ang);
  fill(0,0,0,108);
  rect(-(iconsize*1.05)/2-10,-iconsize/2-20,iconsize*1.05,iconsize*1.05);
  image(icon[3],-iconsize/2,-iconsize/2,iconsize,iconsize); //place icon 3
  popMatrix();
  
  if (rot==0) ang=ang+0.005;
  if (rot==1) ang=ang-0.005;
  if (ang>=0.02) rot=1;
  if (ang<=-0.02) rot=0;
   
}

void mousePressed(){
  ang=0;
  if (mouseButton==LEFT) {
    border++;
    hoverFX.trigger();
    bgmusicplay=true;
  }
  if (border == 5) border = 1;
  if (mouseButton==RIGHT) bgmusicplay=false;
  if (mouseButton==RIGHT && border==1) {
    println("1");
    clickFX.trigger();
    launch("C:/Brushd/brushd_win.exe"); //change as necessary
  }
  if (mouseButton==RIGHT && border==2) {
    println("2");
    clickFX.trigger();
    launch("C:/PrepareForAdventure/PrepareForAdventure.exe"); //change as necessary
  }
  if (mouseButton==RIGHT && border==3) {
    println("3");
    clickFX.trigger();
    launch("C:/JohnnyWoop/JW_Win.exe"); //change as necessary
  }
  if (mouseButton==RIGHT && border==4) {
    println("4");
    clickFX.trigger();
    launch("C:/Splitters/Rai.exe"); //change as necessary
  }
}
    