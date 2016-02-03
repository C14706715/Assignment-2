void setup()
{
  size(500, 500);
background(0);
}
PFont myFont;
void draw()
{
    int x=250;
  int y=250;
  pushMatrix();
  translate(width/2, height/2);
  for(float i=0; i<10000; i++)
  {
    rotate(2);
    translate(20, 4);
  fill(random(0, 255), random(0, 255), random(0, 255));
  ellipse(0, i, 50, 50);
  }
  popMatrix();

    stroke(255, 0, 245);
    fill(0);
  myFont = createFont("Georgia", 62);
  textFont(myFont);
  textAlign(CENTER, CENTER);
  text("Game Over", width/2, height/2);

  
}