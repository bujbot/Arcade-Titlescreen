boolean key1;
boolean key2;

void keyPressed() {
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
    if (key=='d' || key=='D') { //move to icon on the right
      ang = 0;
      selection++;
      hoverFx.trigger();
    }
    
    if (key=='a' || key=='A') { //move to icon on the left
      ang = 0;
      selection--;
      hoverFx.trigger();
    }
    
    if (key==CODED) { 
      if (keyCode==RIGHT){ //move to icon on the right (reversed)
        ang = 0;
        selection++;
        hoverFx.trigger();
      }
      
      if (keyCode==LEFT){ //move to icon on the left (reversed)
        ang=0;
        selection--;
        hoverFx.trigger();
      }
      
      if (keyCode == CONTROL) key1=true; //setting key1 value 1/2
      if (keyCode == ALT) key2=true; //setting key2 value 1/2
    }
  }
  
  if (selection == 4) selection = 1; //these check to see if you need to go to the other side
  if (selection == 0) selection = 3;
}

void keyReleased() {
  if (key == CODED) {
    if (keyCode == CONTROL) key1 = false; //setting key1 value 2/2
    if (keyCode == ALT) key2 = false; //setting key2 value 2/2
  }
}