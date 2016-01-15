//Arrays
color[] Bcolours={color(25, 125, 255), color(255, 248, 0), color(201, 24, 0), color(0, 87, 229)};

//Global Variables
int numFrames=100;

void setup()
{
  size(1400,700);
  
}

void draw()
{
  background(0);
  
  BackgroundColour();
  
}

void BackgroundColour()
{
  //Variables
  float time=float(frameCount % numFrames)/ numFrames;
  color Lcolour= lerpColor(Bcolours[0], Bcolours[2], time);
  color Rcolour= lerpColor(Bcolours[1], Bcolours[3], time);
  
  for(int i=0; i<width; i++)
  {
    float line=i/float(width);
    color moving= lerpColor(Lcolour, Rcolour, line);
    stroke(moving);
    line(i, 0, i, height);
  }
}