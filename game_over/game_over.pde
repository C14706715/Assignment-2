
void setup()
{
  size(500, 500);
  
  //fill(0);
    for(int i=0; i<50; i++)
  {
      background(0);
    stroke(255, 0, 245);
  myFont = createFont("Georgia", i+32);
  textFont(myFont);
  textAlign(CENTER, CENTER);
  text("Game Over", width/2, height/2);

  }

}

void draw()
{

}

  
PFont myFont;