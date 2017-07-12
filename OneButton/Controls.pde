boolean leftClickHovers = true;
boolean hoverButton = false;
boolean clickButton = false;

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
      if (!bgMusicPlay) bgMusicPlay=true;
    }
      
    if (clickButton) {
      clickFx.trigger();
      bgMusicPlay=false;
      
      if (selection == 1) launcher(gamePath1);
      if (selection == 2) launcher(gamePath2);
      if (selection == 3) launcher(gamePath3);
      if (selection == 4) launcher(gamePath4);
    }
  }
}

void launcher(String path) {
  println(selection + ". " + path);
  launch(path);
}