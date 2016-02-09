 import ddf.minim.*;

AudioPlayer groove;
Minim minim;//audio context

void setup()
{
  minim = new Minim(this);
  groove = minim.loadFile("death.mp3", 500);
  groove.play();
}

void draw()
{
}

void stop()
{
  groove.close();
  minim.stop();
  super.stop();
}