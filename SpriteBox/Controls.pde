boolean key1 = false;
boolean key2 = false;

void keyPressed() {
  if (focused) {
    if (key=='k' || key=='K') {
      doorOpen = 1;
      key1 = false;
      key2 = false;
    }
    
    if (!credit) {
      if (key=='c' || key=='C') {
        coinFx.trigger();
        bgMusicPlay = true;
        doorOpen = 0;
        doorTimer = 0;
        key1 = false;
        key2 = false;
        credit=true;
      }
    } else {
      if (key=='d' || key=='D' || (key==CODED && keyCode==RIGHT)) { //move to icon on the right
        selection++;
        hoverFx.trigger();
        bgMusicPlay = true;
      }
      
      if (key=='a' || key=='A' || (key==CODED && keyCode==LEFT)) { //move to icon on the left
        selection--;
        hoverFx.trigger();
        bgMusicPlay = true;
      }
        
      if (key == CODED && keyCode == CONTROL) key1 = true; //setting key1 value 1/2
      if (key == CODED && keyCode == ALT) key2 = true; //setting key2 value 1/2
    }
    
    if (selection == 4) selection = 1; //these check to see if you need to go to the other side
    if (selection == 0) selection = 3;
  }
}

void keyReleased() {
  if (focused) {
    if (key == CODED && keyCode == CONTROL) key1 = false; //setting key1 value 2/2
    if (key == CODED && keyCode == ALT) key2 = false; //setting key2 value 2/2
  }
}