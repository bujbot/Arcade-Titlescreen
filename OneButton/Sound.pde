import ddf.minim.*;

Minim minim;

AudioSample bgMusic;
AudioSample hoverFx;
AudioSample clickFx;

String soundPath = "sounds";

String bgMusicTrack = "background.mp3";
String hoverFxTrack = "hoverFx.wav";
String clickFxTrack = "clickFx.wav";

float gain = 0;

boolean bgMusicPlay = false;
boolean bgMusicOn = false;
boolean stoppedSound = false;

void setupSound() {
  minim = new Minim(this);
  bgMusic = minim.loadSample(soundPath + "/" + bgMusicTrack, 512);
  hoverFx = minim.loadSample(soundPath + "/" + hoverFxTrack, 512);
  clickFx = minim.loadSample(soundPath + "/" + clickFxTrack, 512);

  bgMusic.setGain(gain);
}

void stopSound() {
  bgMusic.stop();
  hoverFx.stop();
  clickFx.stop();
  bgMusicOn = false;
  bgMusicPlay = false;
  stoppedSound = true;
}