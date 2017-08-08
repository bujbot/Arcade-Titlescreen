String gamePath1 = "C:/bb/bb.exe";
String gamePath2 = "C:/PlantedGalaxy/PlantedGalaxy.exe";
String gamePath3 = "C:/ViciousCircles/ViciousCircles.exe";

boolean credit = false;
boolean coin = false; //to regulate coin situation
int doorOpen = 0; //need to check if door is open as safe guard
int doorTimer = 0;

PImage bg;
PImage bg2;
PImage insertCoin;
String imagePath = "images";

int screenX = 1680;
int screenY = 1050;
int iconSize = 230;
int fps = 30;

int selection=2;

Button[] buttons = new Button[3];

int flash=0;
int flashCount=0;

int hover=0;
int hoverLatch=0;

int lastLaunch = 0;
int launchSeparation = 5000; // ms: set to longest time that a game takes to launch

Settings settings;

void setup() {
  settings = new Settings("settings.txt");
  surface.setSize(screenX, screenY); //MAKE SURE THIS MATCHES "screenX" & "screenY" up above
  frameRate(fps);
  fullScreen();
  noCursor();
  
  setupSound();

  buttons[0] = new Button((iconSize / 2) + 506, (iconSize / 2) + 528, 1, imagePath + "/" + "0.png");
  buttons[1] = new Button((screenX / 2) + 2, (iconSize / 2) + 218, 2, imagePath + "/" + "1.png");
  buttons[2] = new Button(screenX - (iconSize / 2) - 506, (iconSize / 2) + 528, 3, imagePath + "/" + "2.png");
  
  bg = loadImage(imagePath + "/" + "bg2.png");
  insertCoin = loadImage(imagePath + "/" + "InsertCoin.png");
  bg2 = loadImage(imagePath + "/" + "bg1.png");

  noStroke();
}

void draw() {
  if (focused) {
    if (stoppedSound) {
      stoppedSound = false;
    }
    
    if (!credit) {
      background(bg2);
    } else {
      background(bg);
    }
    
    if (bgMusicPlay && !bgMusicOn) {
      bgMusic.trigger();
      bgMusicOn = true;
    } else if (!bgMusicPlay && bgMusicOn) {
      bgMusic.stop();
      bgMusicOn = false;
    }
      
    if (credit) {   
      for (int i=0; i<buttons.length; i++) {
        buttons[i].run();
      }
    }
    
    //=====================flashing insert coin
    if (!credit){
        if (flash==1) {
          pushMatrix();
          translate(0,0);
          image(insertCoin,0,0); //insert coin logo
          popMatrix();
        }
         
        if (flashCount==10){
          if (flash==0) {
            flash = 1;
          } else {
            flash = 0;
          }
          flashCount = 0;
        }  
        flashCount++;
    }
    
    //======================door status
    if (doorOpen == 1){
      doorTimer++; 
    }
    
    if (doorTimer >= 60){
      doorOpen = 0;
      doorTimer = 0;
      if (!credit) {
        coinFx.trigger();
        bgMusicPlay = true;
      }  
      credit = true;
    }
    
    //====================game start
    int now = millis();
    if (key1 && key2 && credit && now - lastLaunch >= launchSeparation) {
      clickFx.trigger();
      bgMusicPlay = false; //turns off bg music if a program is launched
      credit = false; //you used your credit!
      lastLaunch = now;
      key1 = false;
      key2 = false;
      bgMusic.stop();
      if (selection == 1) launcher(gamePath1);
      if (selection == 2) launcher(gamePath2);
      if (selection == 3) launcher(gamePath3);
    }
  } else if (!focused && !stoppedSound) {
    stopSound();
  }
}

void launcher(String path) {
  println(selection + ". " + path);
  launch(path);
}
  