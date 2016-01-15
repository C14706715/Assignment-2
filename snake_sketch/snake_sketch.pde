//Classes
Snake test;

//Arrays
color[] Bcolours={color(25, 125, 255), color(255, 248, 0), color(201, 24, 0), color(0, 87, 229)};

//Global Variables
int numFrames=100;

void setup()
{
  size(400, 500);
  test= new Snake();
}

void keyPressed()
{
  if(key==CODED)
  {
    if(keyCode==LEFT)
    {
      test.direction="left";
    }
    else if(keyCode==RIGHT)
    {
      test.direction="right";
    }
    else if(keyCode==UP)
    {
      test.direction="up";
    }
    else
    {
      test.direction="down";
    }
  }
}



  void movement()
  {
    for(int i=test.Snakelength-1; i>0; i=i-1)
    {
      test.xposition.set(i, test.xposition.get(i-1));
      test.yposition.set(i, test.yposition.get(i-1));
    }
  
    if(test.direction=="Left")
    {
      test.xposition.set(0, test.xposition.get(0)-test.sidelength);
    }
    else if(test.direction=="right")
    {
      test.xposition.set(0, test.xposition.get(0)+test.sidelength);
    }
    else if (test.direction=="Up")
    {
      test.yposition.set(0, test.yposition.get(0)+test.sidelength);
    }
    else
    {
      test.yposition.set(0, test.yposition.get(0)-test.sidelength);
    }
  
    test.xposition.set(0, (test.xposition.get(0)+width) % width);
    test.yposition.set(0, (test.yposition.get(0)+height) % height);
  }   
  
  void display()
  {
    for(int i=0; i<test.Snakelength; i++)
    {
      stroke(179, 140, 198);
      fill(100, 0, 100, map(i-1, 0, test.Snakelength-1, 250, 50));
      rect(test.xposition.get(i), test.yposition.get(i), test.sidelength, test.sidelength);
    }
  }
  


void BackgroundColour()
{
  //Variables
  float time=float(frameCount % numFrames)/ numFrames;
  //this function uses two colours. It blends from one colour to another in the time alloted
  color Lcolour= lerpColor(Bcolours[0], Bcolours[2], time);
  color Rcolour= lerpColor(Bcolours[1], Bcolours[3], time);

  for (int i=0; i<width; i++)
  {
    float line=i/float(width);
    color moving= lerpColor(Lcolour, Rcolour, line);
    stroke(moving);
    line(i, 0, i, height);
  }
}

void draw()
{
  BackgroundColour();
  movement();
  display();

}