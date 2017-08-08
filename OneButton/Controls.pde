boolean leftClickHovers = true;
boolean hoverButton = false;
boolean clickButton = false;
int lastLaunch = 0;
int launchSeparation = 5000; // ms: set to longest time that a game takes to launch

void mousePressed(){
  hoverButton = false;
  clickButton = false;

  if (leftClickHovers) {
    if (mouseButton == LEFT) hoverButton = true;
    if (mouseButton == RIGHT) clickButton = true;
  } else {
    if (mouseButton == LEFT) clickButton = true;
    if (mouseButton == RIGHT) hoverButton = true;
  }
  
  if (focused) {    
    if (hoverButton) {
      hoverFx.trigger();
      selection++;
      if (selection > 4) selection = 1;
      bgMusicPlay=true;
    }
      
    int now = millis();
    // prevent launches happening too quickly
    // NOTE: this is to prevent a double launch if focused = true (incorrectly) after a launch
    if (clickButton && now - lastLaunch >= launchSeparation) {
      lastLaunch = now;
      clickFx.trigger();
      bgMusicPlay=false;
      
      if (selection == 1) launcher(gamePath1);
      if (selection == 2) launcher(gamePath2);
      if (selection == 3) launcher(gamePath3);
      if (selection == 4) launcher(gamePath4);
    }
  }
}