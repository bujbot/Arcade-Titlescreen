String gamePath1 = "C:/Brushd/brushd_win.exe";
String gamePath2 = "C:/PrepareForAdventure/PrepareForAdventure.exe";
String gamePath3 = "C:/JohnnyWoop/JW_Win.exe";
String gamePath4 = "C:/Splitters/Rai.exe";

String imagePath = "images";
PImage bg;

int screenX = 1024;
int screenY = 768;
int iconSize = 230;
int fps = 30;

int selection = 1;

Button[] buttons = new Button[4];

Settings settings;

void setup() {
  settings = new Settings("settings.txt");
  surface.setSize(screenX, screenY);
  frameRate(fps);
  fullScreen();
  noCursor();
  
  setupSound();
   
  buttons[0] = new Button(200 + (iconSize / 2) + 42, 100 + (iconSize / 2) - 1, 1, imagePath + "/" + "0.png");
  buttons[1] = new Button(screenX - 200 - (iconSize / 2) - 44, 100 + (iconSize / 2) - 1, 2, imagePath + "/" + "1.png");
  buttons[2] = new Button(200 + (iconSize / 2) + 42, 430 + (iconSize / 2) + 7, 3, imagePath + "/" + "2.png");
  buttons[3] = new Button(screenX - 200 - (iconSize / 2) - 44, 430 + (iconSize / 2) + 7, 4, imagePath + "/" + "3.png");

  bg = loadImage("images/bg.png");

  noStroke();
}

void draw() {
  if (focused) {
    stoppedSound = false;
    background(bg);
    
    if (bgMusicPlay && !bgMusicOn) {
      bgMusic.trigger();
      bgMusicOn = true;
    } else if (!bgMusicPlay && bgMusicOn) {
      bgMusic.stop();
      bgMusicOn = false;
    }
       
    for (int i=0; i<buttons.length; i++) {
      buttons[i].run();
    }

  } else if (!focused && !stoppedSound) {
    stopSound();
  }
}
    