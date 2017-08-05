boolean leftClickHovers = true;
boolean hoverButton = false;
boolean clickButton = false;
int lastLaunch = 0;
int minTimeBetweenLaunch = 5000; // ms

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
      
    if (clickButton && millis() - lastLaunch > minTimeBetweenLaunch) {
      lastLaunch = millis();
      clickFx.trigger();
      bgMusicPlay=false;
      
      if (selection == 1) launcher(gamePath1);
      if (selection == 2) launcher(gamePath2);
      if (selection == 3) launcher(gamePath3);
      if (selection == 4) launcher(gamePath4);
    }
  }
}
