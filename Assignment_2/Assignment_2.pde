//Jake Young
//Assignment 2
//Rollercoaster game (snake game inspired)


//Classes
Snake snake;
Block block;
KillerStar killerStar;
KillerStar killerStar2;
KillerStar killerStar3;
KillerStar killerStar4;



//Arrays
color[] Bcolours={color(25, 125, 255), color(255, 248, 0), color(201, 24, 0), color(0, 87, 229)};


//Global Variables
int numFrames=100;
int highscore=0;
int tempCounter=0;

//Allows to create a font
PFont myFont;


void setup()
{
  size(400, 500);
  
  //creating new instances
  snake = new Snake();
  block = new Block();
  killerStar = new KillerStar();
  killerStar2 = new KillerStar();
  killerStar3 = new KillerStar();
  killerStar4 = new KillerStar();
  
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
    fill(255, 125, 50);
    stroke(255);
    rect(snake.xposition.get(i), snake.yposition.get(i), snake.sidelength, snake.sidelength);
    fill(255, 125, 100);
    ellipse(snake.xposition.get(i), snake.yposition.get(i), snake.sidelength, snake.sidelength);
    stroke(0);
    fill(0);
    ellipse(snake.xposition.get(i)-3,snake.yposition.get(i)-3, 3, 3);
    ellipse(snake.xposition.get(i)+4, snake.yposition.get(i)-4, 3, 3);
    line(snake.xposition.get(i)-5, snake.yposition.get(i)+5, snake.xposition.get(i)+5, snake.yposition.get(i)+5);
    line(snake.xposition.get(i)-5, snake.yposition.get(i)+5, snake.xposition.get(i)-7, snake.yposition.get(i)+3);
    line(snake.xposition.get(i)+5, snake.yposition.get(i)+5, snake.xposition.get(i)+7, snake.yposition.get(i)+3);
  }
}


void FaceDisplay()
{
  stroke(0);
  fill(255, 37, 37);
  ellipse(block.position.x, block.position.y, snake.sidelength, snake.sidelength);
  stroke(34,65,76);
  fill(0, 0, 255);
  ellipse(block.position.x-3, block.position.y-3, 3, 3);
  ellipse(block.position.x+4, block.position.y-4, 3, 3);
  fill(0);
  ellipse(block.position.x+0, block.position.y+5, 10, 6);
}


void killerStarDisplay()
{
  for (int i = 1 ; i <= (killerStar.edges * 2) ; i ++)
  {
    float theta = i * killerStar.thetaInc;
    float x, y;
    float rad;
    if (i % 2 == 1)
    {
      rad = killerStar.radius * 3.5f;
    }
    else
    {
      rad = killerStar.radius;        
    }

    x = killerStar.position.x + sin(theta) * rad;
    y = killerStar.position.y -cos(theta) * rad;
    stroke(random(0, 255), random(0, 255), random(0, 255));
    line(killerStar.lastX, killerStar.lastY, x, y);
    killerStar.lastX = x;
    killerStar.lastY = y;      
  }
}
  

void killerStarDisplay2()
{
  for (int i = 1 ; i <= (killerStar2.edges * 2) ; i ++)
  {
    float theta = i * killerStar2.thetaInc;
    float x, y;
    float rad;
    if (i % 2 == 1)
    {
      rad = killerStar2.radius * 3.5f;
    }
    else
    {
      rad = killerStar2.radius;        
    }

    x = killerStar2.position.x + sin(theta) * rad;
    y = killerStar2.position.y -cos(theta) * rad;
    stroke(random(0, 255), random(0, 255), random(0, 255));
    line(killerStar2.lastX, killerStar2.lastY, x, y);
    killerStar2.lastX = x;
    killerStar2.lastY = y;      
  }
}

void killerStarDisplay3()
{
  for (int i = 1 ; i <= (killerStar3.edges * 2) ; i ++)
  {
    float theta = i * killerStar3.thetaInc;
    float x, y;
    float rad;
    if (i % 2 == 1)
    {
      rad = killerStar3.radius * 3.5f;
    }
    else
    {
      rad = killerStar3.radius;        
    }

    x = killerStar3.position.x + sin(theta) * rad;
    y = killerStar3.position.y -cos(theta) * rad;
    stroke(random(0, 255), random(0, 255), random(0, 255));
    line(killerStar3.lastX, killerStar3.lastY, x, y);
    killerStar3.lastX = x;
    killerStar3.lastY = y;      
  }
}


void killerStarDisplay4()
{
  for (int i = 1 ; i <= (killerStar4.edges * 2) ; i ++)
  {
    float theta = i * killerStar4.thetaInc;
    float x, y;
    float rad;
    if (i % 2 == 1)
    {
      rad = killerStar4.radius * 3.5f;
    }
    else
    {
      rad = killerStar4.radius;        
    }

    x = killerStar4.position.x + sin(theta) * rad;
    y = killerStar4.position.y -cos(theta) * rad;
    stroke(random(0, 255), random(0, 255), random(0, 255));
    line(killerStar4.lastX, killerStar4.lastY, x, y);
    killerStar4.lastX = x;
    killerStar4.lastY = y;      
  }
}

void ExtraBlock()
{
  snake.xposition.add(snake.xposition.get(snake.Snakelength-1)+snake.sidelength);
  snake.yposition.add(snake.yposition.get(snake.Snakelength-1)+snake.sidelength);
  snake.Snakelength++;
  snake.counter++;
  tempCounter=snake.counter;
  
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


void killerStarRestart()
{ 
  killerStar.position.x= random(0, width);
  killerStar.position.y= random(0, height); 
  killerStar2.position.x= random(0, width);
  killerStar2.position.y= random(0, height);  
  killerStar3.position.x= random(0, width);
  killerStar3.position.y= random(0, height);
  killerStar4.position.x= random(0, width);
  killerStar4.position.y= random(0, height);
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
  text("Score " +snake.counter, 10, 470);
  text("Highscore "+highscore, 10, 490);
}


void draw()
{
  BackgroundColour();
  Movement();
  SnakeDisplay();
  FaceDisplay();
  killerStarDisplay();
  for(int i=0; i<snake.Snakelength; i++)
  {
    //dist() measure the distance between the point(x1, y1, x2, y2)
    if(dist(killerStar.position.x, killerStar.position.y, snake.xposition.get(i), snake.yposition.get(i))<snake.sidelength*2)
    {
      killerStarRestart();
    }
  }
  
  for(int i=0; i<snake.Snakelength; i++)
  {
    if(highscore>2)
    {
      killerStarDisplay2();
    
      if(dist(killerStar2.position.x, killerStar2.position.y, snake.xposition.get(i), snake.yposition.get(i))<snake.sidelength*2)
      {
        killerStarRestart();
      }
    }
  }
   
  for(int i=0; i<snake.Snakelength; i++)
  {
    if(highscore>4)
    {
      killerStarDisplay3();
    
      if(dist(killerStar3.position.x, killerStar3.position.y, snake.xposition.get(i), snake.yposition.get(i))<snake.sidelength*2)
      {
        killerStarRestart();
      }
    }
  }
  
  for(int i=0; i<snake.Snakelength; i++)
  {
    if(highscore>8)
    {
      killerStarDisplay4();
  
      if(dist(killerStar4.position.x, killerStar4.position.y, snake.xposition.get(i), snake.yposition.get(i))<snake.sidelength*2)
      {
        killerStarRestart();
      }
    }
  }
  
  
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
  
 /* for(int i=0; i<snake.Snakelength; i++)
  {
    //dist() measure the distance between the point(x1, y1, x2, y2)
    if(dist(killerStar.position.x, killerStar.position.y, snake.xposition.get(i), snake.yposition.get(i))<snake.sidelength*2)
    {
      killerStarRestart();
    }
    if(dist(killerStar2.position.x, killerStar2.position.y, snake.xposition.get(i), snake.yposition.get(i))<snake.sidelength*2)
    {
      killerStarRestart();
    }
    if(dist(killerStar3.position.x, killerStar3.position.y, snake.xposition.get(i), snake.yposition.get(i))<snake.sidelength*2)
    {
      killerStarRestart();
    }
    if(dist(killerStar4.position.x, killerStar4.position.y, snake.xposition.get(i), snake.yposition.get(i))<snake.sidelength*2)
    {
      killerStarRestart();
    }
  }*/ 
  
  //iterates highscore if the  snake is longer than the current high score 
  if(snake.Snakelength > highscore)
  {
    highscore=tempCounter;
  }

  if(highscore<0)
  {
    highscore=0;
  } 
  
  if(snake.counter<0)
  {
    DrawGameOver();
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


void DrawGameOver()
{
  background(0);
  textAlign(CENTER, CENTER);
  myFont = createFont("Times New Roman", 70);
  textFont(myFont);
  
  int radius=50;
  
  //pushMatrix() used to allow translate and rotate to take place
  pushMatrix();
  translate(width/2, height/2);
  for(float i=0; i<10000; i++)
  {
    rotate(2);
    translate(20, 5);
    fill(random(0, 255), random(0, 255), random(0, 255));
    ellipse(0, i, radius, radius);
  }
  //popMatrix()used to contain the movements of rotate and translate
  popMatrix();
  
  fill(255, 0, 0);
  text("Game Over \n highscore: "+highscore, width/2, height/2);
}