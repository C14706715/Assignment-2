class Snake
{
  int Snakelength;
  float sidelength;
  String direction;
  ArrayList <Float> xposition, yposition;
  
  Snake()
  {
    Snakelength=1;
    sidelength=17;
    direction="Right";
    xposition= new ArrayList();
    yposition = new ArrayList();
    xposition.add(random(width));
    yposition.add(random(height));
  }
}