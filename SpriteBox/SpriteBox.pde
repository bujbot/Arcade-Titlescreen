String gamePath1 = "C:/Brushd/brushd_win.exe";
String gamePath2 = "C:/PrepareForAdventure/PrepareForAdventure.exe";
String gamePath3 = "C:/JohnnyWoop/JW_Win.exe";

boolean credit = false, coin = false; //to regulate coin situation
int doorOpen=0; //need to check if door is open as safe guard
int doorTimer=0;

PImage[] icon = new PImage[3];
PImage bg;
PImage bg2;
PImage insertCoin;
String imagePath = "images";

int screenX = 1680;
int screenY = 1050;
int fps = 30;

int flash=0;
int flashCount=0;

int hover=0;
int hoverLatch=0;

float ang=0;
int rot=0;

int selection=2;

int iconSize = 230;
int[] icon1={0+150,50}; //placement of icons
int[] icon2={screenX/2-iconSize/2,50};
int[] icon3={screenX-150-iconSize,50};

//int X = screenX/2;
//int Y = screenY/2;

boolean Wpressed;
boolean Spressed;
boolean Apressed;
boolean Dpressed;
boolean Cpressed;

boolean key1;
boolean key2;

Settings settings;

void setup() {
  settings = new Settings("settings.txt");
  size(1680, 1050); //MAKE SURE THIS MATCHES "screenX" & "screenY" up above
  frameRate(fps);
  //fullScreen();
    
  setupSound();
  
  for (int k=0;k<3;k++) icon[k] = loadImage(imagePath + "/" + k+".png"); //assign image to all spots
  noStroke();
  
  bg=loadImage(imagePath + "/" + "bg2.png");
  insertCoin=loadImage(imagePath + "/" + "InsertCoin.png");
  bg2=loadImage(imagePath + "/" + "bg1.png");
}

void draw() {
  if (credit==false) {
    background(bg2);
  } else {
    background(bg);
  }
  
  if (bgMusicPlay==true && bgMusicOn==false) {
    bgMusic.trigger();
    bgMusicOn=true;
  } else if (bgMusicPlay==false && bgMusicOn==true) {
    bgMusic.stop();
    bgMusicOn=false;
  }
    
  //if (credit==false) tint(150,150);was here before to make the image look like a ghost
  
  if (credit==true){   
    pushMatrix();
    translate(icon1[0]+iconSize/2+356,icon1[1]+iconSize/2+478);
    if (selection==1 && credit==true) rotate(ang);
    fill(0,0,0,108);
    rect(-(iconSize*1.05)/2-10,-iconSize/2-20,iconSize*1.05,iconSize*1.05);
    image(icon[0],-iconSize/2,-iconSize/2,iconSize,iconSize); //place icon 1
    popMatrix();
  }
  if (credit==true){   
    pushMatrix();
    translate(icon2[0]+iconSize/2+2,icon2[1]+iconSize/2+168);
    if (selection==2 && credit==true) rotate(ang);
    fill(0,0,0,108);
    rect(-(iconSize*1.05)/2-10,-iconSize/2-20,iconSize*1.05,iconSize*1.05);
    image(icon[1],-iconSize/2,-iconSize/2,iconSize,iconSize); //place icon 2
    popMatrix();
  }  
  if (credit==true){    
    pushMatrix();
    translate(icon3[0]+iconSize/2-356,icon3[1]+iconSize/2+478);
    if (selection==3 && credit==true) rotate(ang);
    fill(0,0,0,108);
    rect(-(iconSize*1.05)/2-10,-iconSize/2-20,iconSize*1.05,iconSize*1.05);
    image(icon[2],-iconSize/2,-iconSize/2,iconSize,iconSize); //place icon 3
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
        image(insertCoin,0,0); //insert coin logo
        popMatrix();
      }
       
      if (flashCount==10){
        if (flash==0) flash=1;
        else flash=0;
        flashCount=0;
      }  
      flashCount++;
  }
  //======================door status
  if (doorOpen==1){
    doorTimer++; 
  }
  if (doorTimer>=60){
    doorOpen=0;
    doorTimer=0;
    if (credit==false) {
      coinFx.trigger();
      bgMusicPlay=true;
    }  
    credit=true;
  }
  
  //====================game start
  if (key1==true && key2==true && credit==true){
    clickFx.trigger();
    bgMusicPlay=false; //turns off bg music if a program is launched
    credit=false; //you used your credit!
    key1=false;
    key2=false;
    bgMusic.stop();
    if (selection==1) launch("C:/bb/bb.exe"); //change as necessary
    if (selection==2) launch("C:/PlantedGalaxy/PlantedGalaxy.exe"); //change as necessary
    if (selection==3) launch("C:/ViciousCircles/ViciousCircles.exe"); //change as necessary  
    delay (1000);
  }
   
}
  