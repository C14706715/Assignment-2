
Star star;

void setup()
{
  size(500, 500);
  star=new Star();
}

void draw()
{
  Star();
}

void Star()
{
  
    for (int i = 1 ; i <= (star.edges * 2) ; i ++)
    {
      float theta = i * star.thetaInc;
      float x, y;
      float r;
      if (i % 2 == 1)
      {
        r = star.radius * 0.5f;
      }
      else
      {
        r = star.radius;        
      }

      x = star.position.x + sin(theta) * r;
      y = star.position.y -cos(theta) * r;
      line(star.lastX, star.lastY, x, y);
      star.lastX = x;
      star.lastY = y;      
    }
}
  