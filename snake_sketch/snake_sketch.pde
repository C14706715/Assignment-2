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

void draw()
{
  background(255,255, 255);
 // BackgroundColour();
  test.movement();
  test.display();

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


class Snake
{
  int Slength;
  float sidelength;
  String direction;
  ArrayList <Float> xposition, yposition;
  
  Snake()
  {
    Slength=1;
    sidelength=17;
    direction="Right";
    xposition= new ArrayList();
    yposition = new ArrayList();
    xposition.add(random(width));
    yposition.add(random(height));
  }

  void movement()
  {
    for(int i=Slength-1; i>0; i=i-1)
    {
      xposition.set(i, xposition.get(i-1));
      yposition.set(i, yposition.get(i-1));
    }
  
    if(direction=="Left")
    {
      xposition.set(0, xposition.get(0)-sidelength);
    }
    else if(direction=="right")
    {
      xposition.set(0, xposition.get(0)+sidelength);
    }
    else if (direction=="Up")
    {
      yposition.set(0, yposition.get(0)+sidelength);
    }
    else
    {
      yposition.set(0, yposition.get(0)-sidelength);
    }
  
    xposition.set(0, (xposition.get(0)+width) % width);
    yposition.set(0, (yposition.get(0)+height) % height);
  }   
  
  void display()
  {
    for(int i=0; i<Slength; i++)
    {
      stroke(179, 140, 198);
      fill(100, 0, 100, map(i-1, 0, Slength-1, 250, 50));
      rect(xposition.get(i), yposition.get(i), sidelength, sidelength);
    }
  }
  
}

void BackgroundColour()
{
  //Variables
  float time=float(frameCount % numFrames)/ numFrames;
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

 