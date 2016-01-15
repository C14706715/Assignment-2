//Classes
Snake snake;
Block block;

//Arrays
color[] Bcolours={color(25, 125, 255), color(255, 248, 0), color(201, 24, 0), color(0, 87, 229)};

//Global Variables
int numFrames=100;


void setup()
{
  size(400, 500);
  snake= new Snake();
}


void keyPressed()
{
  //CODED checks if any special keys are detected i.e. up, down, left, right
  if(key==CODED)
  {
    if(keyCode==LEFT)
    {
      snake.direction="LEFT";
    }
    else if(keyCode==RIGHT)
    {
      snake.direction="RIGHT";
    }
    else if(keyCode==UP)
    {
      snake.direction="UP";
    }
    else
    {
      snake.direction="DOWN";
    }
  }
}


void movement()
{
  for(int i=snake.Snakelength-1; i>0; i=i-1)
  {
    snake.xposition.set(i, snake.xposition.get(i-1));
    snake.yposition.set(i, snake.yposition.get(i-1));
  }
  
  if(snake.direction=="LEFT")
  {
    snake.xposition.set(0, snake.xposition.get(0)-snake.sidelength);
  }
  else if(snake.direction=="RIGHT")
  {
    snake.xposition.set(0, snake.xposition.get(0)+snake.sidelength);
  }
  else if (snake.direction=="UP")
  {
    snake.yposition.set(0, snake.yposition.get(0)+snake.sidelength);
  }
  else if(snake.direction=="DOWN")
  {
    snake.yposition.set(0, snake.yposition.get(0)-snake.sidelength);
  }
  
  //sets the new x and y position to the width
  snake.xposition.set(0, (snake.xposition.get(0)+width) % width);
  snake.yposition.set(0, (snake.yposition.get(0)+height) % height);
}   
  
void SnakeDisplay()
{
  for(int i=0; i<snake.Snakelength; i++)
  {
    stroke(179, 140, 198);
    //??????
    fill(100, 0, 100, map(i-1, 0, snake.Snakelength-1, 250, 50));
    rect(snake.xposition.get(i), snake.yposition.get(i), snake.sidelength, snake.sidelength);
  }
}

void BlockDisplay()
{
  fill(255,0, 0);
  rect(block.xposition, block.yposition, 10, 10);
}
 

void BackgroundColour()
{
  //Variables
  float time=float(frameCount % numFrames)/ numFrames;
  //lerpColor function uses two colours. It blends from one colour to another in the time alloted
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
  SnakeDisplay();
  BlockDisplay();
}