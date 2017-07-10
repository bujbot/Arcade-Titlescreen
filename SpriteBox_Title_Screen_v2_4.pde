import processing.sound.*;
import ddf.minim.*;

Minim minim;

AudioSample bgmusic;
AudioSample hoverFX;
AudioSample clickFX;
AudioSample coinFX;
String bgmusictrack="background.mp3";
String hoverFXtrack="hoverFX.wav";
String clickFXtrack="clickFX.wav";
String coinFXtrack="coinFX.wav";
String path1;
String path2;
String path3;
String path4;

boolean bgmusicplay = false, bgmusicon = false; //to regulate background music

boolean credit = false, coin = false; //to regulate coin situation
int dooropen=0; //need to check if door is open as safe guard
int doortimer=0;

PImage[] icon = new PImage[3];
PImage bg;
PImage bg2;
PImage insertcoin;

int screenx=1680;
int screeny=1050;

int flash=0;
int flashcnt=0;

int hover=0;
int hoverlatch=0;

float ang=0;
int rot=0;

int border=2;

int iconsize = 230;
int[] icon1={0+150,50}; //placement of icons
int[] icon2={screenx/2-iconsize/2,50};
int[] icon3={screenx-150-iconsize,50};

//int X = screenx/2;
//int Y = screeny/2;

boolean wpressed;
boolean spressed;
boolean apressed;
boolean dpressed;
boolean cpressed;

boolean key1;
boolean key2;

void setup() {
  //size(1680, 1050); //MAKE SURE THIS MATCHES "screenx" & "screeny" up above
  frameRate(30);
  fullScreen();
  
  minim = new Minim(this);
  
  for (int k=0;k<3;k++) icon[k] = loadImage(k+".png"); //assign image to all spots
  noStroke();
  
  bg=loadImage("bg2.png");
  insertcoin=loadImage("InsertCoin.png");
  bg2=loadImage("bg1.png");
  //bg2.filter(GRAY);
  /*
  path1=sketchPath(bgmusictrack); //background music
  bgmusic=new SoundFile(this, path1);
  //bgmusic.play();
  
  path2=sketchPath(hoverFXtrack); //hover over icon FX
  hoverFX=new SoundFile(this, path2);
  
  path3=sketchPath(clickFXtrack); //click icon FX
  clickFX=new SoundFile(this, path3);
  
  path4=sketchPath(coinFXtrack); //click icon FX
  coinFX=new SoundFile(this, path4);
  */
  
  bgmusic=minim.loadSample("background.mp3",512);
  hoverFX=minim.loadSample("hoverFX.wav",512);
  clickFX=minim.loadSample("clickFX.wav",512);
  coinFX=minim.loadSample("coinFX.wav",512);
  
  bgmusic.setGain(-5);

}

void draw() {
  if (credit==false) background(bg2);
  else background(bg);
  
  if (bgmusicplay==true && bgmusicon==false) {
    bgmusic.trigger();
    bgmusicon=true;
  }
  if (bgmusicplay==false && bgmusicon==true) {
    bgmusic.stop();
    bgmusicon=false;
  }
  //if (credit==false) tint(150,150);was here before to make the image look like a ghost
  
  if (credit==true){   
    pushMatrix();
    translate(icon1[0]+iconsize/2+356,icon1[1]+iconsize/2+478);
    if (border==1 && credit==true) rotate(ang);
    fill(0,0,0,108);
    rect(-(iconsize*1.05)/2-10,-iconsize/2-20,iconsize*1.05,iconsize*1.05);
    image(icon[0],-iconsize/2,-iconsize/2,iconsize,iconsize); //place icon 1
    popMatrix();
  }
  if (credit==true){   
    pushMatrix();
    translate(icon2[0]+iconsize/2+2,icon2[1]+iconsize/2+168);
    if (border==2 && credit==true) rotate(ang);
    fill(0,0,0,108);
    rect(-(iconsize*1.05)/2-10,-iconsize/2-20,iconsize*1.05,iconsize*1.05);
    image(icon[1],-iconsize/2,-iconsize/2,iconsize,iconsize); //place icon 2
    popMatrix();
  }  
  if (credit==true){    
    pushMatrix();
    translate(icon3[0]+iconsize/2-356,icon3[1]+iconsize/2+478);
    if (border==3 && credit==true) rotate(ang);
    fill(0,0,0,108);
    rect(-(iconsize*1.05)/2-10,-iconsize/2-20,iconsize*1.05,iconsize*1.05);
    image(icon[2],-iconsize/2,-iconsize/2,iconsize,iconsize); //place icon 3
    popMatrix();
  }
  
  noTint();
  
  if (rot==0) ang=ang+0.005;
  if (rot==1) ang=ang-0.005;
  if (ang>=0.02) rot=1;
  if (ang<=-0.02) rot=0;
  
  //=====================flashing insert coin
  if (credit==false){
      if (flash==1) {
        pushMatrix();
        translate(0,0);
        image(insertcoin,0,0); //insert coin logo
        popMatrix();
      }
       
      if (flashcnt==10){
        if (flash==0) flash=1;
        else flash=0;
        flashcnt=0;
      }  
      flashcnt++;
  }
  //======================door status
  if (dooropen==1){
    doortimer++; 
  }
  if (doortimer>=60){
    dooropen=0;
    doortimer=0;
    if (credit==false) {
      coinFX.trigger();
      bgmusicplay=true;
    }  
    credit=true;
  }
  
  //====================game start
  if (key1==true && key2==true && credit==true){
    clickFX.trigger();
    bgmusicplay=false; //turns off bg music if a program is launched
    credit=false; //you used your credit!
    key1=false;
    key2=false;
    bgmusic.stop();
    if (border==1) launch("C:/bb/bb.exe"); //change as necessary
    if (border==2) launch("C:/PlantedGalaxy/PlantedGalaxy.exe"); //change as necessary
    if (border==3) launch("C:/ViciousCircles/ViciousCircles.exe"); //change as necessary  
    delay (1000);
  }
   
}
  
void keyPressed(){
  
  if (key=='c' || key=='C'){
    if (credit==false) {
      coinFX.trigger();
      bgmusicplay=true;
      dooropen=0;
      doortimer=0;
      key1=false;
      key2=false;
    }  
    credit=true;
  }
  if (key=='k' || key=='K'){
    dooropen=1;
    key1=false;
    key2=false;
  }
  if (key=='d' && credit==true || key=='D' && credit==true) { //move to icon on the right
    ang=0;
    border++;
    hoverFX.trigger();
  }
  if (key=='a' && credit==true || key=='A' && credit==true) { //move to icon on the left
    ang=0;
    border--;
    hoverFX.trigger();
  }
  if (key==CODED && credit==true) { 
    if (keyCode==RIGHT){ //move to icon on the right (reversed)
      ang=0;
      border++;
      hoverFX.trigger();
    }
    if (keyCode==LEFT){ //move to icon on the left (reversed)
      ang=0;
      border--;
      hoverFX.trigger();
    }
    if (keyCode==CONTROL) key1=true; //setting key1 value 1/2
    if (keyCode==ALT) key2=true; //setting key2 value 1/2
  }
  
  if (border == 4) border = 1; //these check to see if you need to go to the other side
  if (border == 0) border = 3;
  
  
}

void keyReleased(){
  if (key==CODED){
    if (keyCode==CONTROL) key1=false; //setting key1 value 2/2
    if (keyCode==ALT) key2=false; //setting key2 value 2/2
  }
}