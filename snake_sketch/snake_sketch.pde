//Jake Young

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
  snake = new Snake();
  block = new Block();
  frameRate(10);
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
    snake.yposition.set(0, snake.yposition.get(0)-snake.sidelength);
  }
  else if(snake.direction=="DOWN")
  {
    snake.yposition.set(0, snake.yposition.get(0)+snake.sidelength);
  }
  
  //sets the new x and y position to the width
  snake.xposition.set(0, (snake.xposition.get(0)+width) % width);
  snake.yposition.set(0, (snake.yposition.get(0)+height) % height);
  
  if(HitTail()==true)
  {
    snake.Snakelength=1;
    
    //place xpos and ypos in temp variable
    float X=snake.xposition.get(0);
    float Y=snake.yposition.get(0);
    
    snake.xposition.clear();
    snake.yposition.clear();
    
    snake.xposition.add(X);
    snake.yposition.add(Y);
  }
}
  
void SnakeDisplay()
{
  for(int i=0; i<snake.Snakelength; i++)
  {
    stroke(255, 125, 0);
    //??????
    fill(255, 125, 0/*, map(i-1, 0, snake.Snakelength-1, 250, 50)*/);    //possibly map method????
    ellipse(snake.xposition.get(i), snake.yposition.get(i), snake.sidelength, snake.sidelength);
      fill(255, 125, 50);
    rect(snake.xposition.get(i), snake.yposition.get(i), snake.sidelength, snake.sidelength);
   fill(255, 125, 100);
    ellipse(snake.xposition.get(i), snake.yposition.get(i), snake.sidelength, snake.sidelength);
  }
}


void ExtraBlock()
{
  snake.xposition.add(snake.xposition.get(snake.Snakelength-1)+snake.sidelength);
  snake.yposition.add(snake.yposition.get(snake.Snakelength-1)+snake.sidelength);
  snake.Snakelength++;
  block.counter++;
}


void BlockDisplay()
{
  stroke(255, 37, 37);
  fill(255, 37, 37);
  
  ellipse(block.xposition, block.yposition, snake.sidelength, snake.sidelength);
  stroke(34,65,76);
  ellipse(block.xposition-3, block.yposition-3, 3, 3);
  ellipse(block.xposition+4, block.yposition-4, 3, 3);
  line(block.xposition-5, block.yposition+5, block.xposition+5, block.yposition+5);
  line(block.xposition-5, block.yposition+5, block.xposition-7, block.yposition+3);
  line(block.xposition+5, block.yposition+5, block.xposition+7, block.yposition+3);
}


void BlockRestart()
{
  block.xposition= random(100, width-100);
  block.yposition= random(100, height-100);
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
  for(int i=0; i<snake.Snakelength; i++)
  {
    //dist() measure the distance between the point(x1, y1, x2, y2)
 
    if(dist(block.xposition, block.yposition, snake.xposition.get(i), snake.yposition.get(i))<snake.sidelength)
    {
      snake.counter++;
      BlockRestart();
      ExtraBlock();
    }
  }
  
  if(block.counter%10==0)
  {
      for(int i=0; i<snake.Snakelength; i++)
  {
    stroke(155, 225, 10);
    //??????
    fill(255, 125, 0/*, map(i-1, 0, snake.Snakelength-1, 250, 50)*/);    //possibly map method????
    ellipse(snake.xposition.get(i), snake.yposition.get(i), snake.sidelength, snake.sidelength);
      fill(55, 25, 50);
    rect(snake.xposition.get(i), snake.yposition.get(i), snake.sidelength, snake.sidelength);
   fill(155, 225, 100);
    ellipse(snake.xposition.get(i), snake.yposition.get(i), snake.sidelength, snake.sidelength);
  }
  }
  
}

boolean HitTail()
{ 
  for(int i=0; i<snake.Snakelength; i++)
  {
    if(dist(snake.xposition.get(0), snake.yposition.get(0), snake.xposition.get(i), snake.yposition.get(i)) < snake.sidelength)
    {
       return false;
    }
  }
  return false; 
}