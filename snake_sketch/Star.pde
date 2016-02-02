



class Star
{
    PVector position;
    float radius;
    int edges;
    color colour;
    float thetaInc;
    float lastX;
    float lastY;
    
    Star()
    {
      position=new PVector(random(0, width), random(0, height));
      radius=13;
      edges=6;
      colour = color(random(0, 255), random(0, 255), random(0, 255));
      thetaInc = TWO_PI / (edges * 2);
      lastX = position.x;
      lastY = position.y -radius; 
      stroke(colour);
    }
}
    