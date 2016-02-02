//Jake Young
//Assignment 2
//Rollercoaster game (snake game inspired)


//Classes
Snake snake;
Block block;
Killer killer;
Star star;


//Arrays
color[] Bcolours={color(25, 125, 255), color(255, 248, 0), color(201, 24, 0), color(0, 87, 229)};


//Global Variables
int numFrames=100;


void setup()
{
  size(400, 500);
  snake = new Snake();
  block = new Block();
  killer = new Killer();
  star=new Star();
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


void Movement()
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
    
    snake.counter=0;
  }
  
}

  
void SnakeDisplay()
{
  for(int i=0; i<snake.Snakelength; i++)
  {
    stroke(255, 125, 0);
    fill(255, 125, 0); 
   // ellipse(snake.xposition.get(i), snake.yposition.get(i), snake.sidelength, snake.sidelength);
    fill(255, 125, 50);
    rect(snake.xposition.get(i), snake.yposition.get(i), snake.sidelength, snake.sidelength);
    fill(255, 125, 100);
    ellipse(snake.xposition.get(i), snake.yposition.get(i), snake.sidelength, snake.sidelength);
    
    stroke(0);
    ellipse(snake.xposition.get(i)-3,snake.yposition.get(i)-3, 3, 3);
    ellipse(snake.xposition.get(i)+4, snake.yposition.get(i)-4, 3, 3);
    line(snake.xposition.get(i)-5, snake.yposition.get(i)+5, snake.xposition.get(i)+5, snake.yposition.get(i)+5);
    line(snake.xposition.get(i)-5, snake.yposition.get(i)+5, snake.xposition.get(i)-7, snake.yposition.get(i)+3);
    line(snake.xposition.get(i)+5, snake.yposition.get(i)+5, snake.xposition.get(i)+7, snake.yposition.get(i)+3);
  }
}


void BlockDisplay()
{
  stroke(255, 37, 37);
  fill(255, 37, 37);
  
  ellipse(block.position.x, block.position.y, snake.sidelength, snake.sidelength);
  stroke(34,65,76);
  ellipse(block.position.x-3, block.position.y-3, 3, 3);
  ellipse(block.position.x+4, block.position.y-4, 3, 3);
  ellipse(block.position.x+0, block.position.y+5, 10, 6);
  /*line(block.position.x-5, block.position.y+5, block.position.x+5, block.position.y+5);
  line(block.position.x-5, block.position.y+5, block.position.x-7, block.position.y+3);
  line(block.position.x+5, block.position.y+5, block.position.x+7, block.position.y+3);
*/}


void KillerDisplay()
{
  ellipse(killer.position.x, killer.position.y, 15, 15);
} 


void ExtraBlock()
{
  snake.xposition.add(snake.xposition.get(snake.Snakelength-1)+snake.sidelength);
  snake.yposition.add(snake.yposition.get(snake.Snakelength-1)+snake.sidelength);
  snake.Snakelength++;
  snake.counter++;
  
  //this changes the colour of the snake once the snake has ten blocks
  if(snake.counter%10==0)
  {
      for(int i=0; i<snake.Snakelength; i++)
      {
        stroke(155, 225, 10);
        fill(255, 125, 0);  
        ellipse(snake.xposition.get(i), snake.yposition.get(i), snake.sidelength, snake.sidelength);
        fill(55, 25, 50);
        rect(snake.xposition.get(i), snake.yposition.get(i), snake.sidelength, snake.sidelength);
        fill(155, 225, 100);
        ellipse(snake.xposition.get(i), snake.yposition.get(i), snake.sidelength, snake.sidelength);
      }
      frameRate(10+(snake.counter/2));
   }
}


void BlockRestart()
{
  block.position.x= random(100, width-100);
  block.position.y= random(100, height-100);
  frameRate(10);
}


void KillerRestart()
{ 
  killer.position.x= random(0, width);
  killer.position.y= random(0, height);  
  frameRate((10+(snake.counter/2))+5);
  snake.counter--;
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


void Score()
{
  int highscore=0;
 
  if(highscore<snake.counter)
  {
    highscore=snake.counter;
  }
  text("Score " +snake.counter, 10, 470);
  text("Highscore "+highscore, 10, 490);
}


void draw()
{
  BackgroundColour();
  Movement();
  SnakeDisplay();
  BlockDisplay();
  KillerDisplay();
  Score();

  for(int i=0; i<snake.Snakelength; i++)
  {
    //dist() measure the distance between the point(x1, y1, x2, y2)
    if(dist(block.position.x, block.position.y, snake.xposition.get(i), snake.yposition.get(i))<snake.sidelength)
    {
      BlockRestart();
      ExtraBlock();
    }
  } 
  
  for(int i=0; i<snake.Snakelength; i++)
  {
    //dist() measure the distance between the point(x1, y1, x2, y2)
    if(dist(killer.position.x, killer.position.y, snake.xposition.get(i), snake.yposition.get(i))<snake.sidelength)
    {
      snake.counter--;
      KillerRestart();
    }
  } 
}


//Boolean used to check if tail is hit, also if user reverses the snake which is invalid
boolean HitTail()
{ 
  for(int i=1; i<snake.Snakelength; i++)
  {
    if(dist(snake.xposition.get(0), snake.yposition.get(0), snake.xposition.get(i), snake.yposition.get(i)) < snake.sidelength)
    {
       return true;
    }
  }
  return false; 
}